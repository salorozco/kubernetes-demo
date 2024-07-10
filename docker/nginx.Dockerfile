FROM nginx:latest

# Copy Nginx configuration file
COPY ../docker/nginx-config/default.conf /etc/nginx/conf.d/default.conf

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy application files
COPY ../ /usr/share/nginx/html

# Expose port 80
EXPOSE 80
