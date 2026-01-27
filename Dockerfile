# Download and unpack target MFT Server installer (usually a .tar.gz or .zip file)

# Select your base image
FROM alpine:3.23.2

# Define ENV vars
ENV JSCAPE_ADMIN_USER=""
ENV JDBC_CONNECTION_STRING=""
ENV JDBC_USER=""
ENV SERVER_MEMORY="2"
ENV PREV_VERSION=""
ENV JSCAPE_MANAGEMENT_HTTP_PORT="11880"
ENV JSCAPE_MANAGEMENT_HTTPS_PORT="11443"
ENV LIBREOFFICE_INSTALL="N"
ENV MAX_ATTEMPTS_STARTUP="3"
ENV DB_SYNC_PERIOD="30"
ENV FIPS_VERSION=""
ENV LICENSE_URL=""
ENV LICENSE_URL_PASSWORD=""

RUN addgroup -S jscapeGroup && adduser -S jscapeService -G jscapeGroup

RUN apk add --no-cache \
      openjdk17-jdk \
      bash \
      net-tools \
      curl \
      unzip \
      tzdata \
      ca-certificates \
      libcap


ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

COPY mft_server /opt/mft_server
RUN mkdir -p /opt/mft_server/startup_scripts /opt/mft_server/startup_scripts/pre_service_start /opt/mft_server/startup_scripts/post_service_start
COPY --chmod=755 ./run.sh /opt/mft_server/startup_scripts/run.sh

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
# AFTP
EXPOSE 3000/tcp
EXPOSE 3000/udp

# Define volumes
#VOLUME /opt/mft_server/etc/license.lic
VOLUME /opt/mft_server/etc
VOLUME /opt/mft_server/libs/jdbc
VOLUME /opt/mft_server/libs/actions
VOLUME /opt/mft_server/libs/ext
VOLUME /opt/mft_server/data
VOLUME /opt/mft_server/users

HEALTHCHECK --interval=60s --timeout=30s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:${JSCAPE_MANAGEMENT_HTTP_PORT}/ || \
      curl -fk https://localhost:${JSCAPE_MANAGEMENT_HTTPS_PORT}/ || \
      exit 1

RUN chown -R jscapeService:jscapeGroup /opt/mft_server && \
    setcap CAP_NET_BIND_SERVICE=+eip /opt/mft_server/server

USER jscapeService

ENTRYPOINT [ "/opt/mft_server/startup_scripts/run.sh" ]