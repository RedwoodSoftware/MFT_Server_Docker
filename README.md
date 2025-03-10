# MFT Server Docker Deployment

This repository contains the necessary files to deploy an MFT (Managed File Transfer) Server using Docker. Below is an explanation of the different components involved and how to structure an example Docker Compose file for deployment.

## How to Deploy

**Run the Docker Compose**:
Find a working directory on your server where you'd like to configure the next items out of. For our purposes here I'll use a working directory called:

**/home/user/mft/**

1. Create the **docker-compose.yaml** file in the working directory by copy and pasting the example below for reference
2. Create a **.env** file for the two secret values, JSCAPE_ADMIN_PASSWORD & JDBC_PASSWORD. An example is outlined below. This file **MUST BE PLACED ALONGSIDE THE COMPOSE FILE**. If you plan to manage this via source, ensure you are ommitting these secrets via .gitignore for security purposes.
3. Run the command below to startup the resources and deploy MFT Server

    ` docker compose up -d `

This will start the MFT Server with the specified configuration and make it accessible on the defined ports.

## Components

### Image Details
The MFT Server image defines the environment baseline configuration
- Base image is `ubuntu:22.04`.
- Defining environment variables for configuration.
- Installing necessary packages such as JRE, curl, unzip, and others.
- Defining volumes for persistent storage.
- Setting a health check to ensure the server is running on the administrative port/s.

### run.sh
The `run.sh` script is the entry point for the Docker container. It performs the following tasks:
- Configures the database connection.
- Initializes and/or upgrades the database schema.
- Sets server memory.
- Adds a default administrator if not present.
- Configures command-line tools and the Management UI.
- Generates a server key if not present.
- Adds a domain for the MFT Server if not present.
- Starts the main server process.

## Example Docker Compose File

Below is an example `docker-compose.yaml` file for deploying the MFT Server:

```yaml
services:
    mft_server:
        # Update to reflect the desired version if not the latest release
        image: "public.ecr.aws/s9n3l9g8/redwood/mft_server:latest"
        environment:
            # Username to be created for intial JSCAPE MFT Server administrator access
            JSCAPE_ADMIN_USER: ""
            # Password to be assigned to that initial JSCAPE MFT Server administrator
            JSCAPE_ADMIN_PASSWORD: ${JSCAPE_ADMIN_PASSWORD}
            # JDBC connection string used for targeting the JSCAPE backend database. NOTE: This database must exist prior deploying, this process will populate the JSCAPE MFT Server schema into this empty database
            JDBC_CONNECTION_STRING: ""
            # Username for accessing the database referenced in JDBC_CONNECTION_STRING
            JDBC_USER: ""
            # Password for accessing the database referenced in JDBC_CONNECTION_STRING
            JDBC_PASSWORD: ${JDBC_PASSWORD}
            # Memory to assign to the JVM for MFT Server to be able to leverage. This is simply a number representing GB.
            SERVER_MEMORY: "4"
            # Previous JSCAPE version including minor release numbering (ex. 2024.3.1.512). This should be set if looking to upgrade the deployment to a newer release. The update can also be done via the UI in the Global Settings pane if properly maintained via docker volumes.
            PREV_VERSION: ""
            # Name of the JSCAPE MFT Server domain to create upon instantiation of the environment. This will NOT overwrite any settings if already present.
            JSCAPE_ENV_NAME: ""
        # Please note that not all ports are needed and if you do not plan on using them, feel free to omit from your compose file.
        ports:
            # Port mapping for admin HTTP interface (only one of the two is required but both can be used). NOTE: if you choose to update the internal port reference, you must also assign the same port to the JSCAPE_MANAGEMENT_HTTP_PORT environment variable
            - "11880:11880"
            # Port mapping for admin HTTPS interface (only one of the two is required but both can be used). NOTE: if you choose to update the internal port reference, you must also assign the same port to the JSCAPE_MANAGEMENT_HTTPS_PORT environment variable
            - "11443:11443"
            # Port mapping for SFTP connections
            - "22:22"
            # Port mapping for HTTPS Web Client interface (only one of the two is required but both can be used between 80 and 443)
            - "443:443"
            # Port mapping for HTTP Web Client interface (only one of the two is required but both can be used between 80 and 443)
            - "80:80"
            # Port mapping for AFTP connections
            - "3305:3305/udp"
            # Port mapping for JSCAPE Agent connections
            - "40025:40025"
        volumes:
            # REQUIRED license file mapping to allow MFT Server to start. If you do not have this please contact your account manager.
            - ./license.lic:/opt/mft_server/etc/license.lic
            # Persistent volume storage for configurations, custom libraries, users, data, and domain logs.
            - mft_server_data:/opt/mft_server/etc
            - mft_server_data:/opt/mft_server/libs/jdbc
            - mft_server_data:/opt/mft_server/libs/actions
            - mft_server_data:/opt/mft_server/libs/ext
            - mft_server_data:/opt/mft_server/data
            - mft_server_data:/opt/mft_server/users
            - mft_server_data:/opt/mft_server/logs

volumes:
    mft_server_data:
```

## Example .env File

Below is an example `.env` file for deploying the MFT Server:

```.env
# .env file
JSCAPE_ADMIN_PASSWORD=your_admin_password
JDBC_PASSWORD=your_jdbc_password
```