FROM php:7.4-cli-alpine

# Install required dependencies
RUN apk add --no-cache \
    libzip-dev \
    oniguruma-dev

# Install PHP extensions
RUN docker-php-ext-install \
    zip 

# Create music directory and set permissions
RUN mkdir -p /music && \
    chmod 777 /music

# Set working directory
WORKDIR /var/www/html

# Copy the file manager
COPY tinyfilemanager.php index.php

# Expose port 80
EXPOSE 80

# Start PHP server
CMD ["sh", "-c", "php -S 0.0.0.0:80"]
