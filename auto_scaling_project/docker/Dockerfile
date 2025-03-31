# Use a lightweight web server
FROM nginx:latest

# Copy website files to Nginx
COPY app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
