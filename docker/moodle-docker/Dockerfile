FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
    apt-get install -y git apache2 php php-fpm php-curl php-zip php-pgsql php-pspell php-gd 		php-intl php-xml php-xmlrpc php-ldap php-soap php-mbstring libapache2-mod-php graphviz 		aspell ghostscript clamav acl sudo &&\
    apt-get clean

RUN a2enmod proxy_fcgi setenvif &&\
    a2enconf php7.2-fpm

#COPY moodle /var/www/html/moodle
RUN mkdir /var/www/html/moodle &&\
    chown -R www-data /var/www/html/moodle &&\
    chmod -R 755 /var/www/html/moodle

RUN mkdir /var/www/moodledata &&\
    chown -R www-data /var/www/moodledata &&\
    chmod -R 777 /var/www/moodledata

COPY entrypoint.sh /var/entrypoint.sh
RUN chmod 755 /var/entrypoint.sh
ENTRYPOINT ["/var/entrypoint.sh"]

EXPOSE 80
CMD apachectl -D FOREGROUND
