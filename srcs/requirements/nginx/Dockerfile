FROM alpine:3.20

# Install Nginx, OpenSSL, and OpenRC
RUN apk update && apk add --no-cache nginx openssl openrc

# Setup OpenRC to prevent service start issues
RUN openrc && touch /run/openrc/softlevel

# Create SSL certificate directory and generate self-signed SSL certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -keyout //etc/ssl/nginx-selfsigned.key \
    -subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=tiaferna.42.fr"

# Copy Nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose ports for HTTP (80) and HTTPS (443)
EXPOSE 80 443

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]



















































































EXPOSE 443

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f https://localhost || exit 1

CMD ["nginx", "-g", "daemon off;"]
