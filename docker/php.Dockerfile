FROM php:7.4-fpm

# Copy application files
COPY ../ ./

# Set working directory
WORKDIR /var/www/html

# Expose port 9000
EXPOSE 9000

# Command to run php-fpm
CMD ["php-fpm"]
