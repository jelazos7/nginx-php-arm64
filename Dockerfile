FROM ericvh/arm64-ubuntu

# install LEMP stack sans MySQL using instructions from
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx php5-fpm
RUN echo "\ncgi.fix_pathinfo=0\n" >> /etc/php5/fpm/php.ini
RUN rm -rf /etc/nginx/sites-available/* && rm -rf /etc/nginx/sites-enabled/*

VOLUME /usr/share/nginx/html
COPY nginx/html /usr/share/nginx/html
COPY nginx/conf /etc/nginx/conf.d
COPY php/init.d/* /etc/init.d
COPY php/pool.d/* /etc/php5/fpm/pool.d

CMD service php5-fpm start && nginx -g "daemon off;"
EXPOSE 80

