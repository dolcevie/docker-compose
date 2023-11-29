FROM nginx:stable-alpine

ENV NGINXUSER=nginx
ENV NGINXGROUP=nginx

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf
RUN sed -i "s/group www-data/group ${NGINXGROUP}/g" /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html/code

COPY ./nginx/sites/*.conf /etc/nginx/conf.d/

ADD nginx/certs/certificate.test.pem /etc/nginx/certs/certificate.test.pem
ADD nginx/certs/certificate.test.key /etc/nginx/certs/certificate.test.key

RUN chown -R ${NGINXUSER}:${NGINXUSER} /etc/nginx

RUN apk add --no-cache tzdata openssh-client
ENV TZ=America/Mexico_City
