#!/bin/bash
# Create a default (embedded) database configuration
./js-database-configuration -configure -url jdbc:mysql://${RDS_ENDPOINT}:3306/${RDS_DB_NAME} -user ${RDS_CUSTOMER_DB_USERNAME} -password ${RDS_CUSTOMER_DB_PASSWORD}

# Initialize the database tables
./js-database-configuration -test > /dev/null && echo "Database already initialized" || (./js-database-configuration -init)
# ./js-database-configuration -init

if [ -z "$PREV_VERSION" ]
then
    echo "Previous version environment variable is missing or empty, skipping upgrade process"
else
    echo "Previous version environment variable detected, proceeding with upgrade..."
    echo "Running upgrade of database schema..."
    ./js-database-configuration -update -previous-version ${PREV_VERSION}
    echo "Database schema upgrade successful"
    echo "Updating data protection..."
    ./js-database-configuration -update-data-protection
    echo "Data protection updated successfully"
fi

# Add an administrator
./js-addadmin -db -username ${APP_MANAGEMENT_USERNAME} -password ${APP_MANAGEMENT_PASSWORD} -sa

# Add a support administrator
./js-addadmin -db -name "Redwood Support Administrator" -username ${SUPPORT_MANAGEMENT_USERNAME} -password ${SUPPORT_MANAGEMENT_PASSWORD} -sa -disabled

# Create a server configuration for command-line tools
./js-server-configuration -host 0.0.0.0 -port 10880 -timeout 60

# Create a client configuration for command-line tools
./js-client-configuration -host 0.0.0.0 -port 10880 -timeout 60 -user ${APP_MANAGEMENT_USERNAME} -password ${APP_MANAGEMENT_PASSWORD}

# Create a server configuration for management UI
./js-web-configuration -host 0.0.0.0 -port 11880 -timeout 60

# Generate a key 
./js-add-server-key -alias example_rsa -rsa -size 2048

# Set JVM memory in server.vmoptions
./set-server-jvm-memory.sh --memory ${JVM_MEMORY}

# Start Service
/opt/mft_server/start_service.sh

# Wait 30 seconds for service to start
sleep 30

# Create Domain
./js-adddomain -d ${TENANT_NAME} -ld %installdir%/logs/%domain%

# Wait 30 seconds for domain to be created
sleep 30

# Create Network Storage
./create-s3-network-storage.sh

# Enable User Portal
./js-enablehttp -host 0.0.0.0 -p 80

# Start the cron
service cron restart

# Loop to keep process active
while true; do sleep 1; done