#!/bin/bash

# Run to reset files before pushing to git with

sed -i "s/${LOGIN}/login/g" Makefile
sed -i "s/${LOGIN}/login/g" srcs/.env
sed -i "s/${LOGIN}/login/g" srcs/requirements/nginx/Dockerfile
sed -i "s/${LOGIN}/login/g" srcs/requirements/nginx/conf/default.conf