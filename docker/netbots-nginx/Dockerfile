# syntax=docker/dockerfile:1
FROM nginx:stable

WORKDIR /nginx_ws

EXPOSE 80
EXPOSE 443


RUN apt-get -y update
RUN apt-get -y install git openssl

RUN mkdir src && git clone -b master https://github.com/whomihirpatel/4G-Networked_Robots.git src

RUN mkdir -p /var/www/html && cp src/website_front_end/* /var/www/html && mv src/nginx_scripts/default.conf /etc/nginx/conf.d/default.conf
RUN openssl req -x509 -nodes -days 365 \
    -subj  "/C=US/ST=IL/O=mihy/CN=mihy.tech" \
     -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
     -out /etc/ssl/certs/nginx-selfsigned.crt;


    #openssl genrsa -des3 -passout pass:x -out server.pass.key 2048 && \
    #openssl rsa -passin pass:x -in server.pass.key -out server.key && \
    #rm server.pass.key && \
    #openssl req -new -key server.key -out server.csr \
    #    -subj "/C=US/ST=IL/O=Let's Encrypt/OU=IT Department/CN=mihy.tech" && \
    #openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

RUN mkdir /etc/nginx/apps && cp src/nginx_scripts/webviz.conf /etc/nginx/apps/webviz.conf
CMD ["nginx","-g","daemon off;"]