FROM ubuntu:12.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git curl apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

# Install app
RUN rm -rf /var/www/*
ADD . /var/www
RUN  cd /var/www && /usr/bin/composer install

# Configure apache
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod expires
RUN chmod 755 /usr/sbin/apache2ctl
ADD /app/vhosts/apache.conf /etc/apache2/sites-available/default
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN chown -R www-data:www-data /var/www
RUN chmod 755 /var/www

EXPOSE 80

# CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
CMD ["docker-yii-apache"]