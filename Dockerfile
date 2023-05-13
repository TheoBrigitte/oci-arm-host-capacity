FROM php:7.4 as builder

# Install zip (composer dependency)
RUN apt update
RUN apt install -y zip

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Install app
WORKDIR /app
COPY src src
COPY index.php .
COPY composer.json .
COPY composer.lock .

# Install app dependencies
RUN composer validate
RUN composer update --prefer-dist --no-progress

# Build (smaller) runtime image
FROM php:7.4-alpine as runtime
WORKDIR /app

COPY --from=builder /app /app

CMD ["/usr/local/bin/php", "index.php"]
