# Stage 1: Build Stage
FROM node:alpine AS build

# Set the working directory
WORKDIR /app

# Copy the HTML files into the build directory
COPY html/ /app/html/

# Optionally, you can build or minify HTML/CSS/JS files if needed
# For example, if using a static site generator, run the build command here

# Stage 2: Nginx Runtime Stage
FROM nginx:alpine

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy built HTML content from the build stage to Nginx's default content directory
COPY --from=build /app/html/ /usr/share/nginx/html/

# Expose port 80 for the Nginx server
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
