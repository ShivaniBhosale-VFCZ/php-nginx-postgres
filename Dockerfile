# Use PHP 8.1 image as base  for running PHP with Nginx.
FROM php:8.1-fpm

# Install dependencies like Git and other required PHP extensions The libpq-dev package is installed to allow PHP to communicate with PostgreSQL The pdo_pgsql extension is installed to enable PDO-based communication with PostgreSQL.
RUN apt-get update && apt-get install -y \
    git \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions for PostgreSQL
RUN docker-php-ext-install pdo pdo_pgsql

# Set the working directory
WORKDIR /var/www

# Expose PHP-FPM port
EXPOSE 9000
