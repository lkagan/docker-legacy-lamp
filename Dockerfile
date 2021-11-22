FROM ubuntu:16.04
WORKDIR /var/www/html
RUN apt update \
    && apt -y install \
        vim less \
        php php-common php-curl php-gd php-mysql php-xml php-json \
        php-mcrypt php-mbstring apache2 libapache2-mod-php \
        apache2 \
    && apt-get clean
RUN a2enmod php7.0
COPY apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY php.ini /etc/php/7.0/apache2/conf.d/
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
