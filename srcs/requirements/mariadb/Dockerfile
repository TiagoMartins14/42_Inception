FROM alpine:3.20

# Install MariaDB
RUN apk update && \
    apk add --no-cache \
    	mariadb \
   	mariadb-client \
    	openrc && \
    openrc && \
    touch /run/openrc/softlevel && \
    mkdir /mariadb

# Copy MariaDB configuration file
COPY ./conf/mdb-server.cnf /etc/my.cnf.d/

# Copy scripts
COPY ./tools/* /mariadb
RUN chmod +x /mariadb/*.sh

# Expose MariaDB port
EXPOSE 3306

# Run MariaDB configuration script as entry point
ENTRYPOINT [ "/bin/sh", "/mariadb/init.sh" ]

