FROM alpine:3.20

# Install necessary packages and PHP extensions
RUN apk update && \
    apk add --no-cache \
        php83 \
        php83-fpm \
        php83-mysqli \
        php83-json \
        php83-curl \
        php83-dom \
        php83-exif \
        php83-fileinfo \
        php83-mbstring \
        php83-openssl \
        php83-pdo \
        php83-pdo_mysql \
        php83-phar \
        php83-xml \
        php83-zip \
        mariadb-client \
        openrc \
        wget \
        jq \
        bash && \
    mkdir -p /wordpress && \
    mkdir -p /usr/lical/bin/wp && \
    openrc && \
    touch /run/openrc/softlevel

# Install WP-CLI
RUN wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create a www-data system user and add it to the www-data group
RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

# Copy and set permissions for the WordPress configuration script
COPY ./conf/wp-config.php /wordpress
COPY ./conf/www.conf /etc/php83/php-fpm.d
COPY ./tools/init.sh /wordpress

RUN chmod +x /wordpress/init.sh

# Run the WordPress configuration script at container startup
ENTRYPOINT [ "/bin/sh", "wordpress/init.sh" ]


