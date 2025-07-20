FROM nginx:latest as final

# Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom NGINX configuration
COPY ./nginx.conf /etc/nginx/nginx.conf

# Copy static files from the 'source' directory to NGINX's HTML directory
COPY ./source /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]


