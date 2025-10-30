#!/bin/bash

set -e

#######################################################
###################  FUNCTIONS  #######################
#######################################################

# Function to execute scripts in a directory
execute_scripts_in_directory() {
    local script_dir="$1"
    local stage="$2"
    
    if [[ ! -d "$script_dir" ]]; then
        echo "Directory $script_dir does not exist, skipping $stage scripts"
        return 0
    fi
    
    # Check if directory has executable scripts
    local script_count=$(find "$script_dir" -maxdepth 1 -type f -executable | wc -l)
    
    if [[ $script_count -eq 0 ]]; then
        echo "No executable scripts found in $script_dir, skipping $stage scripts"
        return 0
    fi
    
    echo "Executing $stage scripts from $script_dir..."
    
    # Execute all executable files in the directory in alphabetical order
    for script in "$script_dir"/*; do
        if [[ -f "$script" && -x "$script" ]]; then
            echo "Running $stage script: $(basename "$script")"
            if "$script"; then
                echo "Successfully executed: $(basename "$script")"
            else
                echo "WARNING: Script $(basename "$script") failed with exit code $?"
                # You can change this to 'exit 1' if you want to fail on any script failure
            fi
        fi
    done
    
    echo "Completed $stage scripts execution"
}

# Function to check startup attempts and handle failure
check_startup() {
    local attempt=0

    while [[ $attempt -lt ${MAX_ATTEMPTS_STARTUP} ]]; do
        if netstat -tuln | grep -q ":${JSCAPE_MANAGEMENT_HTTPS_PORT}\|:${JSCAPE_MANAGEMENT_HTTP_PORT}"; then
            echo "Listener on port ${JSCAPE_MANAGEMENT_HTTPS_PORT} or ${JSCAPE_MANAGEMENT_HTTP_PORT} is enabled and running"
            echo "MFT Server Started"
            break
        else
            echo "Listener on port ${JSCAPE_MANAGEMENT_HTTPS_PORT} or ${JSCAPE_MANAGEMENT_HTTP_PORT} is not running, attempt $((attempt+1)) of ${MAX_ATTEMPTS_STARTUP}"
            echo "Netstat output for debugging:"
            netstat -tuln
            attempt=$((attempt+1))
            if [[ $attempt -lt ${MAX_ATTEMPTS_STARTUP} ]]; then
                sleep 10
            fi
        fi
    done

    if [[ $attempt -eq ${MAX_ATTEMPTS_STARTUP} ]]; then
        echo "Listener on port ${JSCAPE_MANAGEMENT_HTTP_PORT} failed to start after ${MAX_ATTEMPTS_STARTUP} attempts"
        echo "MFT Server Failed to Start ---------------"
        echo "Server log file:"
        cat /opt/mft_server/var/log/server0.log
        exit 1
    fi
}

# Function to tail the server log file
tail_server_log() {
    echo "------------------------MFT Server log file------------------------"
    tail -f /opt/mft_server/var/log/server0.log
}

# Function to enable or disable FIPS libraries based on FIPS_VERSION environment variable
toggle_fips() {
    local fips_version="${FIPS_VERSION:-}"
    
    if [[ -n "$fips_version" ]]; then
        case "$fips_version" in
            "FIPS-140-2")
                echo "Enabling FIPS 140-2 libraries..."
                echo "Creating backups of existing Bouncy Castle libraries..."
                mkdir -p /opt/mft_server/libs/backup
                
                # Backup existing BC libraries if they exist
                if ls /opt/mft_server/libs/bc* 1> /dev/null 2>&1; then
                    mv /opt/mft_server/libs/bc* /opt/mft_server/libs/backup/
                fi
                
                echo "Replacing Bouncy Castle libraries with FIPS 140-2 compliant versions..."
                if [[ -d /opt/mft_server/fips ]]; then
                    cp /opt/mft_server/fips/bc* /opt/mft_server/libs/
                else
                    echo "ERROR: FIPS 140-2 directory not found at /opt/mft_server/libs/fips/"
                    return 1
                fi
                ;;
                
            "FIPS-140-3")
                echo "Enabling FIPS 140-3 libraries..."
                echo "Creating backups of existing Bouncy Castle libraries..."
                mkdir -p /opt/mft_server/libs/backup
                
                # Backup existing BC libraries if they exist
                if ls /opt/mft_server/libs/bc* 1> /dev/null 2>&1; then
                    mv /opt/mft_server/libs/bc* /opt/mft_server/libs/backup/
                fi
                
                echo "Replacing Bouncy Castle libraries with FIPS 140-3 compliant versions..."
                if [[ -d /opt/mft_server/fips/2.0 ]]; then
                    cp /opt/mft_server/fips/2.0/*.jar /opt/mft_server/libs/
                else
                    echo "ERROR: FIPS 140-3 directory not found at /opt/mft_server/fips/2.0/"
                    return 1
                fi
                ;;
                
            *)
                echo "ERROR: Invalid FIPS_VERSION specified: '$fips_version'"
                echo "Valid values are: 'FIPS-140-2' or 'FIPS-140-3'"
                return 1
                ;;
        esac
        
        echo "FIPS libraries enabled successfully."
        
    else
        # Check if default libraries are present (6 files matching bc*jdk18on*)
        local default_lib_count=$(find /opt/mft_server/libs -maxdepth 1 -name "bc*jdk18on*" -type f | wc -l)
        
        if [[ $default_lib_count -eq 6 ]]; then
            # Default state detected, skip all operations silently
            return 0
        fi
        
        echo "Disabling FIPS libraries (FIPS_VERSION not set)..."
        if [[ -d /opt/mft_server/libs/backup ]]; then
            echo "Restoring original Bouncy Castle libraries from backup..."
            
            # Remove current FIPS libraries
            if ls /opt/mft_server/libs/bc* 1> /dev/null 2>&1; then
                rm -f /opt/mft_server/libs/bc*
            fi
            
            # Restore from backup
            mv /opt/mft_server/libs/backup/bc* /opt/mft_server/libs/
            rmdir /opt/mft_server/libs/backup 2>/dev/null || true
            
            echo "FIPS libraries have been disabled."
        else
            echo "No backup of original libraries found and original libraries are not in libs directory. Unable to disable FIPS libraries."
            return 1
        fi
    fi
}


#######################################################
###################  END FUNCTIONS  ###################
#######################################################

trap 'echo "Script terminated"; exit' INT TERM

echo "Establishing Database Connection..."
./js-database-configuration -configure -url "${JDBC_CONNECTION_STRING}" -user "${JDBC_USER}" -password "${JDBC_PASSWORD}" -sync-period "${DB_SYNC_PERIOD}"

if [[ -z "$PREV_VERSION" ]]; then
    echo "Previous version environment variable is missing or empty, skipping upgrade process"
else
    echo "Previous version environment variable detected, proceeding with upgrade..."
    echo "Running upgrade of database schema..."
    ./js-database-configuration -update -previous-version "${PREV_VERSION}"
    echo "Database schema upgrade successful"
    echo "Updating data protection..."
    ./js-database-configuration -update-data-protection
    echo "Data protection updated successfully"
fi

# Initialize the database tables
if ./js-database-configuration -test > /dev/null; then
    echo "Database already initialized"
    DB_INITIALIZED=true
else
    ./js-database-configuration -init
    DB_INITIALIZED=false
fi

if [[ "$LIBREOFFICE_INSTALL" == "Y" ]]; then
    echo "LIBREOFFICE_INSTALL is set to Y, installing LibreOffice..."
    apt-get update && apt-get install -y libreoffice
    echo "LibreOffice installed successfully"
fi

toggle_fips

echo "Setting Server Memory..."
sed -i "s/-Xmx1024m/-Xmx${SERVER_MEMORY}g/g" /opt/mft_server/server.vmoptions

echo "Creating a configuration for command-line tools..."
./js-client-configuration -host 0.0.0.0 -port 10880 -timeout 60 -user "${JSCAPE_ADMIN_USER}" -password "${JSCAPE_ADMIN_PASSWORD}"
echo "Creating server configuration for Management UI..."
./js-web-configuration -host 0.0.0.0 -port ${JSCAPE_MANAGEMENT_HTTP_PORT} -timeout 60

if [[ -z "$PREV_VERSION" && "$DB_INITIALIZED" == false ]]; then
    echo "Adding default administrator..."
    ./js-addadmin -db -username "$JSCAPE_ADMIN_USER" -password "$JSCAPE_ADMIN_PASSWORD" -sa > /dev/null || (echo "$JSCAPE_ADMIN_USER already exists")
    echo "Generating server key..."
    ./js-add-server-key -alias example_rsa -rsa -size 2048
fi

# Execute pre-service start scripts
execute_scripts_in_directory "./startup_scripts/pre_service_start" "pre-service"

# Start main process
./start_service.sh

sleep 30

check_startup

# Execute post-service start scripts
execute_scripts_in_directory "./startup_scripts/post_service_start" "post-service"

tail_server_log