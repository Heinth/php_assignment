# Use an official PHP runtime as a base image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Install any dependencies your PHP application might require
# For example, if you're using MySQL with PHP
RUN docker-php-ext-install mysqli pdo_mysql

# Install Vim
RUN apt-get update && apt-get install -y vim

# Enable Apache modules
RUN a2enmod rewrite

# Expose port 80 for Apache
EXPOSE 80

# Specify the command to run on container start
CMD ["apache2-foreground"]
