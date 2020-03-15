FROM php:7.4-apache

# variables
ARG SECURITY_PHRASE
ENV SECURITY_PHRASE $SECURITY_PHRASE
ARG PASSWORD
ENV PASSWORD $PASSWORD
ARG ADMIN
ENV ADMIN $ADMIN

# setup workspace
ADD . /var/www/html/
WORKDIR /var/www/html/

# install packages
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
RUN apt-get autoremove -y ; rm -rf /var/lib/apt/lists/*

# setup & start server
CMD ["./setup.sh"]
