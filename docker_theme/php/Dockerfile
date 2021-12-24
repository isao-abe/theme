## docker hubのphp-7.2-fpmを使用する
FROM php:7.3.14-fpm-buster

## 変数設定
ENV DEBIAN_FRONTEND noninteractive
ARG http_proxy
ARG https_proxy

RUN echo "Acquire::http::Pipeline-Depth 0;Acquire::http::No-Cache true;Acquire::BrokenProxy    true;" > /etc/apt/apt.conf.d/99fixbadproxy

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y git
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y mcrypt
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libjson-c-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y libspatialindex-dev

RUN apt-get install -y libonig-dev
RUN docker-php-ext-install mbstring
RUN apt-get install -y libzip-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install json
RUN docker-php-ext-install pcntl

RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN docker-php-ext-install gd
RUN docker-php-ext-install opcache

#!/bin/sh
RUN apt-get install -y wget
RUN EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
RUN if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; \
    then \
        >&2 echo 'ERROR: Invalid installer signature'; \
        rm composer-setup.php; \
        exit 1; \
    fi;

RUN php composer-setup.php --quiet
RUN RESULT=$?

RUN mv composer.phar /usr/local/bin/composer
RUN rm composer-setup.php
RUN exit $RESULT

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH $PATH:/composer/vendor/bin
ENV PATH $PATH:/data1/home/theme/vendor/bin

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN mkdir -p /usr/share/man/man1
RUN apt install -y openjdk-8-jdk || apt install -y openjdk-11-jdk

RUN apt-get install -y \
    python \
    python-pip \
    python3 \
    python3-pip \
    libsm6 \
    libxext6 \
    libxrender-dev \
    sudo

RUN pip3 install numpy opencv-python scipy pysal pointpats geopandas

# usdPythonで利用
RUN pip install numpy

RUN chown -R www-data:www-data /var/www

RUN apt-get install -y wget  g++
RUN apt-get install -y cmake


RUN node_modules_path=$(npm root -g) && \
    chmod 755 $node_modules_path && \
    chmod 755 $(dirname $node_modules_path)

RUN sudo apt install -y ffmpeg

RUN apt-get install -y libjpeg-dev \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
