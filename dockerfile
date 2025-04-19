FROM nginx:alpine

# Copy everything in the 'frontend' folder into Nginx's default webroot
COPY ./frontend /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]