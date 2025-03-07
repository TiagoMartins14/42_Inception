#!/bin/sh

# Read secrets from variables
if [ -f "$DB_ROOT_PASS" ]; then
    export DB_ROOT_PASS=$(cat "$DB_ROOT_PASS")
fi
if [ -f "$WP_DB_PASS" ]; then
    export WP_DB_PASS=$(cat "$WP_DB_PASS")
fi

echo "[DB config] Configuring MariaDB..."

if [ ! -d "/run/mysqld" ]; then
	echo "[DB config] Granting MariaDB daemon run permissions..."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d "/var/lib/mysql/mysql" ]
then
	echo "[DB config] MariaDB already configured."
else
	echo "[DB config] Installing MySQL Data Directory..."
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
	echo "[DB config] MySQL Data Directory done."

	echo "[DB config] Configuring MySQL..."
	TMP=/tmp/.tmpfile

	echo "USE mysql;" > ${TMP}
	echo "FLUSH PRIVILEGES;" >> ${TMP}
	echo "DELETE FROM mysql.user WHERE User='';" >> ${TMP}
	echo "DROP DATABASE IF EXISTS test;" >> ${TMP}
	echo "DELETE FROM mysql.db WHERE Db='test';" >> ${TMP}
	echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> ${TMP}
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';" >> ${TMP}
	echo "CREATE DATABASE ${WP_DB_NAME};" >> ${TMP}
	echo "CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';" >> ${TMP}
	echo "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';" >> ${TMP}
	echo "FLUSH PRIVILEGES;" >> ${TMP}

	# Manually start and configure the mysql daemon
	/usr/bin/mysqld --user=mysql --bootstrap < ${TMP}
	rm -f ${TMP}
	echo "[DB config] MySQL configuration done."
fi

echo "[DB config] Allowing remote connections to MariaDB"
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

echo "[DB config] Starting MariaDB daemon on port 3306."
exec $@