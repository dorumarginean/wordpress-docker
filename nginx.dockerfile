# Build the container using the previously used image
FROM nginx:stable-alpine

# Copy local files to nginx container
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
ADD ./nginx/certs /etc/nginx/certs/self-signed