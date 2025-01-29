FROM alpine:3.20

# Install Nginx, OpenSSL, and OpenRC
RUN apk update && apk upgrade && apk add nginx openssl curl && \
    mkdir -p /var/www/html/

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# Create SSL certificate directory and generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42Porto/CN=tiago.42.fr"

RUN adduser -D -g 'www' www && \
    chown -R www:www /run/nginx/ && \
    chown -R www:www /var/www/html/

# Expose ports for HTTPS
EXPOSE 443

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]



















































































EXPOSE 443

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f https://localhost || exit 1

CMD ["nginx", "-g", "daemon off;"]
