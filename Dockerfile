# Download and unpack target MFT Server installer (usually a .tar.gz or .zip file)

# Select your base image
FROM ubuntu:22.04

# Define ENV vars
ENV JSCAPE_ADMIN_USER=""
ENV JDBC_CONNECTION_STRING=""
ENV JDBC_USER=""
ENV SERVER_MEMORY="2"
ENV PREV_VERSION=""
ENV JSCAPE_DOMAIN_NAME=""
ENV JSCAPE_MANAGEMENT_HTTP_PORT="11880"
ENV JSCAPE_MANAGEMENT_HTTPS_PORT="11443"
ENV LIBREOFFICE_INSTALL="N"

# Install a JRE. This step can be skipped if a JRE is already present in the base image.
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install default-jre-headless curl unzip cron net-tools nano locales && apt-get clean \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
ENV LC_ALL=en_US.UTF-8
COPY mft_server /opt/mft_server
COPY --chmod=755 ./run.sh /opt/mft_server/run.sh

WORKDIR /opt/mft_server

# Admin Portal HTTP
EXPOSE 11880/tcp
# Admin Portal HTTPS
EXPOSE 11443/tcp
# SFTP
EXPOSE 22/tcp
# HTTPS
EXPOSE 443/tcp
# FTP/S
EXPOSE 21/tcp
# OFTP2
EXPOSE 3305/tcp
# HTTP
EXPOSE 80/tcp
# Agent
EXPOSE 40025/tcp

# Define volumes
VOLUME /opt/mft_server/etc/license.lic
VOLUME /opt/mft_server/etc
VOLUME /opt/mft_server/libs/jdbc
VOLUME /opt/mft_server/libs/actions
VOLUME /opt/mft_server/libs/ext
VOLUME /opt/mft_server/data
VOLUME /opt/mft_server/users

#HEALTHCHECK --interval=60s --timeout=30s --start-period=30s --retries=3 CMD netstat -an | grep -E ":(${JSCAPE_MANAGEMENT_HTTP_PORT}|${JSCAPE_MANAGEMENT_HTTPS_PORT})\s" || exit 1

ENTRYPOINT [ "/opt/mft_server/run.sh" ]