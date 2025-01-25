FROM alpine:3.20

# Install MariaDB
RUN apk update && \
    apk add --no-cache mariadb mariadb-client

# Copy MariaDB configuration file
COPY ./conf/configure-mariadb.sh /tmp/configure-mariadb.sh
RUN chmod +x /tmp/configure-mariadb.sh

# Run MariaDB configuration script as entry point
ENTRYPOINT ["sh", "/tmp/configure-mariadb.sh"]

