# Use official Python base image
FROM python:3.13.3

# Set the working directory in the container
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Copy the SSL certificate files into the container
COPY cert.pem /app/cert.pem
COPY key.pem /app/key.pem

# Set environment variables (can also come from docker-compose or .env)
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
ENV FLASK_ENV=development

# Run the Flask app
CMD ["python", "app.py"]
