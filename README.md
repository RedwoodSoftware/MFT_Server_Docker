# MFT Server Docker Deployment

This repository contains the necessary files to deploy an MFT (Managed File Transfer) Server using Docker. Below is an explanation of the different components involved and how to structure an example Docker Compose file for deployment.

_Please review the license terms prior to deployment_

## Image Repository:
[https://gallery.ecr.aws/redwood-software/redwood/mft_server](https://gallery.ecr.aws/redwood-software/redwood/mft_server)

## JSCAPE Docker Support Policy

JSCAPE provides limited support for its products running in Docker containers.

### What We Support
- Functional issues within the JSCAPE container itself

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
Find a working directory on your server where you'd like to configure the next items out of. For our purposes here I'll use a working directory called:

**/home/user/mft/**

1. Download the **docker-compose.yaml** (for Standalone) or **postgres.compose.yaml** (for JSCAPE with Postgres) file into your working directory using one of the following commands, or copy from the repository above:

    **Standalone:**
    ```sh
    wget -O docker-compose.yaml https://raw.githubusercontent.com/RedwoodSoftware/MFT_Server_Docker/refs/heads/2025.1.0.523/docker-compose.yaml
    ```

    **JSCAPE with Postgres:**
    ```sh
    wget -O docker-compose.yaml https://raw.githubusercontent.com/RedwoodSoftware/MFT_Server_Docker/refs/heads/2025.1.0.523/postgres.compose.yaml
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
- Starts the main server process.