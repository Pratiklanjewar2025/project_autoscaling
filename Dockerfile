# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy current directory contents into the container
COPY . .

# Install dependencies
RUN pip install Flask==2.3.2

# Expose port Flask is running on
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
