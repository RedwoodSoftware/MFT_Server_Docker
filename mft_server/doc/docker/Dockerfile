# Download and unpack target MFT Server installer (usually a .tar.gz or .zip file)

# Select your base image
FROM ubuntu:22.04

# Install a JRE. This step can be skipped if a JRE is already present in the base image.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install default-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install curl unzip
RUN apt-get -y update; apt-get -y install curl unzip

# Install LibreOffice (required by DocViewer feature)
RUN apt-get -y install libreoffice

# Install ClamAV (required for default AV)
RUN apt-get update && \
    apt-get install -y clamav

# Update ClamAV database
RUN freshclam

# Install cron and other dependencies
RUN apt-get update && \
    apt-get -y install cron && \
    apt-get clean

# Copy your cron file into the container
COPY cronjob /etc/cron.d/cronjob

# Give execution rights to the cron job
RUN chmod 0644 /etc/cron.d/cronjob

# Apply cron job
RUN crontab /etc/cron.d/cronjob

# Start the cron
#CMD service cron start && tail -f /dev/null

# Unpack MFT Server files to your target image (/opt/mft_server)
COPY mft-server-install-unix-@VERSION@.zip mft-server.zip
RUN unzip mft-server.zip -d /opt/

# Copy the license file
# COPY license.lic /opt/mft_server/etc/

# Prepare Redwood integration
RUN cp -f /opt/mft_server/webapp/management/WEB-INF/web.xml /opt/mft_server/webapp/management/WEB-INF/web.xml.bak
RUN cp -f /opt/mft_server/webapp/management/WEB-INF/web-rmj.xml /opt/mft_server/webapp/management/WEB-INF/web.xml

RUN cp -f /opt/mft_server/webapp/filetransfer/WEB-INF/web.xml /opt/mft_server/webapp/filetransfer/WEB-INF/web.xml.bak
RUN cp -f /opt/mft_server/webapp/filetransfer/WEB-INF/web-rmj.xml /opt/mft_server/webapp/filetransfer/WEB-INF/web.xml

# Set a working directory for subsequent execution instructions
WORKDIR /opt/mft_server

# Copy scripts
COPY run.sh /opt/mft_server/run.sh
COPY create-s3-network-storage.sh /opt/mft_server/create-s3-network-storage.sh
COPY set-server-jvm-memory.sh /opt/mft_server/set-server-jvm-memory.sh
COPY clamav-db-update.sh /opt/mft_server/clamav-db-update.sh
RUN chmod +x run.sh
RUN chmod +x create-s3-network-storage.sh
RUN chmod +x set-server-jvm-memory.sh
RUN chmod +x clamav-db-update.sh
#Let the application know it is running in SaaS
ENV MFT_PLATFORM=SaaS

# Specify the container application entrypoint
ENTRYPOINT /opt/mft_server/run.sh

# Run the container using
# docker run -it -p 11880:11880  jscape:latest