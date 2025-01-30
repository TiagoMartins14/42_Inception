#!/bin/bash

# LOGIN variable need to be edited in Makefile first

sed -i "s/login/${LOGIN}/g" srcs/.env
sed -i "s/login/${LOGIN}/g" srcs/requirements/nginx/Dockerfile
sed -i "s/login/${LOGIN}/g" srcs/requirements/nginx/conf/default.conf
