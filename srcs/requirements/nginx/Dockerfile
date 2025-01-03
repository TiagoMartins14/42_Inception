FROM alpine:3.20

RUN apk add --no-cache nginx openssl curl && \
    mkdir -p /run/nginx /etc/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -out /etc/ssl/nginx.crt \
        -keyout /etc/ssl/nginx.key \
        -subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=localhost" && \
    chmod 600 /etc/ssl/nginx.key

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f https://localhost || exit 1

CMD ["nginx", "-g", "daemon off;"]
