FROM nginx:latest as final

# Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf

# Not needed when using tmpfs:
RUN mkdir -p \
      /run \
      /var/cache/nginx/client_temp \
      /var/cache/nginx/proxy_temp \
      /var/cache/nginx/fastcgi_temp \
      /var/run \
      /var/log/nginx \
  && chown -R nginx:nginx \
      /var/cache/nginx /var/run /var/log/nginx /run

USER nginx # UID: 101 | GID: 101

# Apply the custom NGINX configuration
COPY ./nginx.conf /etc/nginx/nginx.conf

# Copy static site
COPY source/ /usr/share/nginx/html/

EXPOSE 80

# Health check with curl (available since 1.18.0)
HEALTHCHECK --interval=30s --timeout=5s \
  CMD curl -fs http://localhost/ || exit 1 

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
