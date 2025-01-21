#!/bin/sh

# Initialize MariaDB data directory if not already initialized
#if [ ! -d "/var/lib/mysql/mysql" ]; then
    # echo "Initializing MariaDB data directory..."
    # mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    # chown -R mysql:mysql /var/lib/mysql

    # echo "Starting MariaDB to run initial SQL setup..."
    # /usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --user=mysql &
    # MARIADB_PID=$!

    rc-service mariadb start
    # Wait for MariaDB to start
    sleep 5

    # Run custom SQL initialization script
    /mariadb/sqlinit.sh

    # Shut down MariaDB
    mysqladmin --user=root shutdown
#fi

# Start MariaDB server
echo "Executing MariaDB..."
exec /usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --user=mysql --plugin-dir=/usr/lib/mariadb/plugin --pid-file=/run/mysqld/mariadb.pid

