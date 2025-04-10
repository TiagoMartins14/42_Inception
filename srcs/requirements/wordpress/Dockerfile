FROM alpine:3.20

# Install necessary packages and PHP extensions
RUN	apk update && \
	apk add php83 php83-fpm php83-bcmath php83-bz2 php83-calendar php83-cli php83-ctype \
		php83-curl php83-dom php83-exif php83-fileinfo php83-gd php83-gmp \
		php83-iconv php83-imap php83-intl php83-json php83-mbstring \
		php83-mysqli php83-mysqlnd php83-openssl php83-pcntl php83-pdo php83-pdo_mysql \
		php83-pdo_pgsql php83-pdo_sqlite php83-pgsql php83-phar php83-posix php83-session \
		php83-shmop php83-simplexml php83-soap php83-sockets php83-sodium php83-sqlite3 \
		php83-sysvsem php83-sysvshm php83-tokenizer php83-xml php83-xmlreader php83-xmlwriter \
		php83-xsl php83-zip php83-zlib &&\
	apk add mariadb-client

# Configure PHP-fpm to listen on internal inception network port 9000
RUN	sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php83/php-fpm.d/www.conf

# Install WP-CLI
RUN apk add curl && \ 
    curl -o wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/bin/wp-cli.phar

# Copy and set permissions for the WordPress configuration script
COPY ./conf/configure-wordpress.sh /tmp/configure-wordpress.sh
RUN chmod +x /tmp/configure-wordpress.sh

WORKDIR /var/www/html/wordpress

# Expose ports for HTTPS
EXPOSE 9000

# Run the WordPress configuration script at container startup
ENTRYPOINT [ "sh", "/tmp/configure-wordpress.sh" ]
CMD ["/usr/sbin/php-fpm83", "-F", "-R"]


