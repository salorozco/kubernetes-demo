FROM nginx:latest

# Copy Nginx configuration file
COPY ../docker/nginx-config /etc/nginx/conf.d

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy application files
COPY ../ /usr/share/nginx/html

# Expose port 80
EXPOSE 80
