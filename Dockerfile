# Use the Nginx alpine base image
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the custom Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the HTML content to the Nginx default content directory
COPY html/ /usr/share/nginx/html/

# Expose port 80 to access the Nginx server
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
