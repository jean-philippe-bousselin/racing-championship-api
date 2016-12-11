FROM ubuntu:16.04

VOLUME ["/var/www"]

# PHP/Apache2
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php7.0 \
      php7.0-cli \
      libapache2-mod-php7.0 \
      php7.0-gd \
      php7.0-json \
      php7.0-ldap \
      php7.0-mbstring \
      php7.0-mysql \
      php7.0-pgsql \
      php7.0-sqlite3 \
      php7.0-xml \
      php7.0-xsl \
      php7.0-zip \
      php7.0-soap

COPY docker/apache_default /etc/apache2/sites-available/000-default.conf
COPY docker/run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

RUN apt-get install vim

# Copy project files
COPY . /var/www
WORKDIR /var/www

# Define default command.
CMD ["/usr/local/bin/run"]

EXPOSE 80 3306



# git required to install composer dependencies
# RUN apt-get install git
# composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
