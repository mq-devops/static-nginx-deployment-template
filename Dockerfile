FROM nginx:latest

# Copy static files to the default NGINX html directory
COPY ./source /usr/share/nginx/html

# Expose the default NGINX port
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
