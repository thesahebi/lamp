FROM php:7.4.3-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql 
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    vim \
    nano

RUN apt-get update && \
     apt-get install -y \
         libzip-dev \
         && docker-php-ext-install zip
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands

# Set working directory
WORKDIR /var/www

