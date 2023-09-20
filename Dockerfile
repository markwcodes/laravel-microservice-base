# Install composer packages
FROM composer:2 as vendor

WORKDIR /tmp/

COPY composer.json composer.json
COPY composer.lock composer.lock

RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

# Setup app container
FROM php:8.2-apache
LABEL org.opencontainers.image.source=https://github.com/markwcodes/laravel-microservice-base

# Configure Apache to serve public directory
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN a2enmod rewrite

# Add CD build environment variables
ARG BUILD_VERSION
ENV BUILD_VERSION=$BUILD_VERSION
ARG COMMIT_HASH
ENV COMMIT_HASH=$COMMIT_HASH

# Copy project files into web root
COPY . /var/www/html
# Copy composer packages into vendor directory
COPY --from=vendor /tmp/vendor/ /var/www/html/vendor/

# Configure Laravel
WORKDIR /var/www/html/
RUN chmod -R 777 storage
RUN php artisan storage:link
