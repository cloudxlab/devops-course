# Use an existing docker image as base
From python:latest

# Copy the requirements.txt from your work directory to the container's work directory
# Until we copy the requirements.txt file to container work directory, pip install will not work
COPY ./requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the source code from your work directory to the container's work directory
COPY ./ ./

# Exposing port 8000 on the container. This is the port where flask application is running
EXPOSE 8000

# Startup Command
CMD ["python", "hello.py"]
