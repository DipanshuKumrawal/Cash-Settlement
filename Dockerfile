# Use an official Nginx image as base
FROM nginx:alpine

# Copy static website files to Nginx HTML directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
COPY index.php /usr/share/nginx/html/
COPY heap.js /usr/share/nginx/html/

# Expose port 8000
EXPOSE 8000
