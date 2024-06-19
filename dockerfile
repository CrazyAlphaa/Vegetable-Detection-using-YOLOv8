# Use the official Python image from the Docker Hub
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the image
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV PORT 8080

# Expose the port that the application will run on
EXPOSE 8080

# Run the application
CMD ["gunicorn", "-w", "4", "-b", ":8080", "app:app"]
