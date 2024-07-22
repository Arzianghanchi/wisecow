FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application code
COPY app.py /app/
COPY requirements.txt /app/
COPY wisecow.sh /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install necessary Linux packages
RUN apt-get update && apt-get install -y \
    fortune \
    cowsay \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Make wisecow.sh executable
RUN chmod +x /app/wisecow.sh

# Expose the application port
EXPOSE 4499

# Start the application
CMD ["/app/wisecow.sh"]
