# Build the container using the previously used image
FROM php:7.4-fpm-alpine

# Install extensions 'mysqli', 'pdo', 'pdo_mysql' and enable 'pdo_mysql'
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# Get the WP-Cli executable
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Install WP-Cli
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp