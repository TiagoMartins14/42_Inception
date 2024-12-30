FROM: alipne:v3.20

RUN: apk update && apk add --no-cache nginx openssl

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
