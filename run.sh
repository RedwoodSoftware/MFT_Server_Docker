#!/bin/bash

set -e

#######################################################
###################  FUNCTIONS  #######################
#######################################################

# Function to check startup attempts and handle failure
check_startup() {
    local attempt=0

    while [[ $attempt -lt ${MAX_ATTEMPTS_STARTUP} ]]; do
        if netstat -tulnp | grep -q ":${JSCAPE_MANAGEMENT_HTTPS_PORT}\|:${JSCAPE_MANAGEMENT_HTTP_PORT}"; then
            echo "Listener on port ${JSCAPE_MANAGEMENT_HTTPS_PORT} or ${JSCAPE_MANAGEMENT_HTTP_PORT} is enabled and running"
            echo "MFT Server Started"
            break
        else
            echo "Listener on port ${JSCAPE_MANAGEMENT_HTTPS_PORT} or ${JSCAPE_MANAGEMENT_HTTP_PORT} is not running, attempt $((attempt+1)) of ${MAX_ATTEMPTS_STARTUP}"
            echo "Netstat output for debugging:"
            netstat -tulnp
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

#######################################################
###################  END FUNCTIONS  ###################
#######################################################

trap 'echo "Script terminated"; exit' INT TERM

echo "Establishing Database Connection..."
./js-database-configuration -configure -url "${JDBC_CONNECTION_STRING}" -user "${JDBC_USER}" -password "${JDBC_PASSWORD}" -sync-period "${DB_SYNC_PERIOD}" > /dev/null 2>&1

# Initialize the database tables
if ./js-database-configuration -test > /dev/null; then
    echo "Database already initialized"
    DB_INITIALIZED=true
else
    ./js-database-configuration -init
    DB_INITIALIZED=false
fi

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

if [[ "$LIBREOFFICE_INSTALL" == "Y" ]]; then
    echo "LIBREOFFICE_INSTALL is set to Y, installing LibreOffice..."
    apt-get update && apt-get install -y libreoffice
    echo "LibreOffice installed successfully"
fi

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

# Start main process
./start_service.sh

sleep 30

check_startup

if [[ -n "$PREV_VERSION" || "$DB_INITIALIZED" == true ]]; then
    echo "Database initialized, domain should already be present..."
elif [[ -z "$PREV_VERSION" && -n "$JSCAPE_DOMAIN_NAME" ]]; then
    echo "Adding (JSCAPE_DOMAIN_NAME=$JSCAPE_DOMAIN_NAME) domain..."
    ./js-adddomain -d "${JSCAPE_DOMAIN_NAME}" -ld "%installdir%/logs/%domain%"
fi

tail_server_log