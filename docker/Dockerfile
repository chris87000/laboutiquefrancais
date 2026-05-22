FROM php:8.4.1-apache

RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    locales \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    nodejs \
    npm

# Apache rewrite
RUN a2enmod rewrite


# PHP extensions
RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg

RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    intl \
    zip \
    gd \
    opcache \
    mbstring

# Composer
#RUN curl -sS https://getcomposer.org/installer | php \
#    && mv composer.phar /usr/local/bin/composer

RUN curl -sS https://getcomposer.org/installer | php -- \
    --version=2.5.8 \
    && mv composer.phar /usr/local/bin/composer
# Yarn
RUN npm install -g yarn

WORKDIR /var/www/html

CMD ["apache2-foreground"]
