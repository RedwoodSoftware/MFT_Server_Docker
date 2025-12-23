# MFT Server Docker Deployment

This repository contains the necessary files to deploy an MFT (Managed File Transfer) Server using Docker. Below is an explanation of the different components involved and how to structure an example Docker Compose file for deployment.

_Please review the license terms prior to deployment_

## Image Repository:
[https://gallery.ecr.aws/redwood-software/redwood/mft_server](https://gallery.ecr.aws/redwood-software/redwood/mft_server)

## JSCAPE Docker Support Policy

JSCAPE provides limited support for its products running in Docker containers.

### What We Support
- Functional product issues within the JSCAPE container itself

### What We Don't Support
- Issues related to the container orchestration environment (e.g., Kubernetes, Docker Swarm), including:
    - Orchestration platform configuration and management
    - Container scheduling and networking

### Customer Responsibilities
- You are responsible for configuring and maintaining the container orchestration environment
- Sample configurations are provided as a starting point, but they are not part of the core JSCAPE product

### Getting Support
For support with JSCAPE-specific issues within a container, contact our support team with details of the problem and the Docker image used.

## How to Deploy

**Run the Docker Compose**:
Find a working directory on your server where you'd like to configure the next items. For our purposes here I'll use a working directory called:

**/home/user/mft/**

1. Download the **docker-compose.yaml** (for Standalone) or **postgres.compose.yaml** (for JSCAPE with Postgres) file into your working directory using one of the following commands, or copy from the repository above:

    **Standalone:**
    ```sh
    wget -O docker-compose.yaml https://raw.githubusercontent.com/RedwoodSoftware/MFT_Server_Docker/refs/heads/main/docker-compose.yaml
    ```

    **JSCAPE with Postgres:**
    ```sh
    wget -O docker-compose.yaml https://raw.githubusercontent.com/RedwoodSoftware/MFT_Server_Docker/refs/heads/main/postgres.compose.yaml
    ```

2. Download a `.env` file template to start with using one of the following commands, or copy from the repository above:

    **Standalone:**
    ```sh
    wget -O .env https://raw.githubusercontent.com/RedwoodSoftware/MFT_Server_Docker/refs/heads/2025.1.0.523/.env.example
    ```

    **JSCAPE with Postgres:**
    ```sh
    wget -O .env https://raw.githubusercontent.com/RedwoodSoftware/MFT_Server_Docker/refs/heads/2025.1.0.523/.env.postgres.example
    ```

3. Ensure that your **license.lic** file is in the working directory as well so that you have 3 files present:

        /home/user/mft/
            ├── .env
            ├── docker-compose.yaml
            └── license.lic


4. Adjust .env values as needed. This generally includes passwords for your connections for example and should be updated with secure values.

5. Run the command below to startup the resources and deploy MFT Server

    ` docker compose up -d `

This will start the MFT Server with the specified configuration and make it accessible on the defined ports.

## Environment Variables Reference

### Required Variables

| Variable | Description | Default | Example | Notes |
|----------|-------------|---------|---------|-------|
| `JSCAPE_ADMIN_USER` | Username for initial MFT Server administrator account | None | `"admin"` | Created during initial deployment. Optional if database already initialized. |
| `JSCAPE_ADMIN_PASSWORD` | Password for initial MFT Server administrator account | None | `"SecureAdminPassword123!"` | Set in `.env` file for security; reference as `${JSCAPE_ADMIN_PASSWORD}` in docker-compose. Required for initial deployment. |
| `JDBC_CONNECTION_STRING` | JDBC connection string for backend database | `""` (empty) | `"jdbc:postgresql://postgres:5432/mft_server"` | Target database must exist before deployment. Other JDBC compliant flags are supported. Format: `jdbc:<driver>://<host>:<port>/<database>` |
| `JDBC_USER` | Username for database access | `""` (empty) | `"jscape"` | User must have privileges to create/modify tables in target database. |
| `JDBC_PASSWORD` | Password for database user | None | `"SecureDBPassword456!"` | Set in `.env` file for security; reference as `${JDBC_PASSWORD}` in docker-compose. Required when using external database. |

### Optional Variables

| Variable | Description | Default | Example | Notes |
|----------|-------------|---------|---------|-------|
| `SERVER_MEMORY` | Memory in GB allocated to JVM | `"4"` | `"4"`, `"8"`, `"16"` | Sets JVM `-Xmx` parameter. Ensure container has sufficient resources. |
| `PREV_VERSION` | Previous JSCAPE version for upgrades | `""` (empty) | `"2024.3.1.512"` | Format: `YYYY.X.Y.BUILD`. Only needed during upgrades. Leave empty for new deployments. |
| `JSCAPE_MANAGEMENT_HTTP_PORT` | HTTP port for admin interface | `"11880"` | `"11880"`, `"8080"` | Must match port mapping in docker-compose. Used by health check. |
| `JSCAPE_MANAGEMENT_HTTPS_PORT` | HTTPS port for admin interface | `"11443"` | `"11443"`, `"8443"` | Must match port mapping in docker-compose. Used by health check. |
| `FIPS_VERSION` | Enable FIPS compliance mode | `""` (empty) | `"FIPS-140-2"`, `"FIPS-140-3"` | Replaces Bouncy Castle libraries with FIPS-compliant versions. Empty disables FIPS. |
| `MAX_ATTEMPTS_STARTUP` | Max startup verification attempts | `"3"` | `"5"`, `"10"` | Number of times to check if management port is listening (10s between attempts). |
| `DB_SYNC_PERIOD` | Database sync period in seconds | `"30"` | `"60"`, `"120"` | Frequency of config synchronization with database. Lower = faster propagation, higher = less DB load. |
| `LICENSE_URL` | URL to download license file | None | `"https://example.com/license"` | Alternative to volume-mounted license. Volume mount takes precedence if both provided. |
| `LICENSE_URL_PASSWORD` | Password for protected license URL | None | `"SuperSecretPassword"` | Required when downloading a protected license via `LICENSE_URL`. Set in `.env` and reference as `${LICENSE_URL_PASSWORD}` in docker-compose. |

### Configuration Examples

**Standalone Deployment (.env file):**
```bash
JSCAPE_ADMIN_PASSWORD=SecureAdminPassword123!
JDBC_PASSWORD=SecureDBPassword456!
```

**PostgreSQL Deployment (.env file):**
```bash
JSCAPE_ADMIN_PASSWORD=SecureAdminPassword123!
JDBC_PASSWORD=SecureDBPassword456!
POSTGRES_PASSWORD=SecurePostgresPassword789!
```

**FIPS-Compliant Deployment (docker-compose.yaml):**
```yaml
environment:
  JSCAPE_ADMIN_USER: "admin"
  JSCAPE_ADMIN_PASSWORD: ${JSCAPE_ADMIN_PASSWORD}
  SERVER_MEMORY: "8"
  FIPS_VERSION: "FIPS-140-3"
  MAX_ATTEMPTS_STARTUP: "5"
```

**Upgrade Scenario (docker-compose.yaml):**
```yaml
environment:
  JSCAPE_ADMIN_USER: "admin"
  JSCAPE_ADMIN_PASSWORD: ${JSCAPE_ADMIN_PASSWORD}
  JDBC_CONNECTION_STRING: "jdbc:postgresql://postgres:5432/mft_server"
  JDBC_USER: "jscape"
  JDBC_PASSWORD: ${JDBC_PASSWORD}
  SERVER_MEMORY: "4"
  PREV_VERSION: "2024.3.1.512"
```

## Components

### Image Details
The MFT Server image defines the environment baseline configuration
- Base image is `alpine:3.22.2`.
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
- Starts the main server process.
- allows running of pre and post custom scripts
- allows toggling of FIPS compliance for 140-2 and 140-3 based on environment variables
