#!/bin/bash

# Set PHP Version
PHP_VERSION=7.1

# Clone
printf "\n"
printf "Cloning PHPRedis...\n"
printf "PHP Version: $PHP_VERSION\n"

cd /tmp
git clone https://github.com/phpredis/phpredis phpredis
cd phpredis

# Install
printf "Installing PHPRedis...\n"

phpize
./configure
sudo make
sudo make install

# Configure
printf "Configuring PHPRedis!\n"

sudo echo "extension=redis.so" > /etc/php/$PHP_VERSION/mods-available/redis.ini
sudo ln -s /etc/php/$PHP_VERSION/mods-available/redis.ini /etc/php/$PHP_VERSION/fpm/conf.d/30-redis.ini
sudo ln -s /etc/php/$PHP_VERSION/mods-available/redis.ini /etc/php/$PHP_VERSION/cli/conf.d/30-redis.ini

# Restart
printf "Restarting PHP!\n"
sudo service php$PHP_VERSION-fpm restart
