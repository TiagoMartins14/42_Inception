FROM alpine:v3.20

RUN apk add --no-cache \
        nginx \
        openssl

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
