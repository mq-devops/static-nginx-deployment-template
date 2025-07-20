FROM nginx:latest as final

# Copy your custom NGINX configuration
COPY ./nginx.conf /etc/nginx/nginx.conf

# Create nginx user/group
RUN addgroup --system nginx && adduser --system --ingroup nginx nginx

# Apply strict permissions
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p \
      /run \
      /var/cache/nginx/client_temp \
      /var/cache/nginx/proxy_temp \
      /var/cache/nginx/fastcgi_temp \
      /var/run \
      /var/log/nginx \
  && chown -R nginx:nginx \
      /var/cache/nginx /var/run /var/log/nginx /run

 # Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy static site
COPY --chown=nginx:nginx source/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

USER nginx
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://localhost/ || exit 1

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]


