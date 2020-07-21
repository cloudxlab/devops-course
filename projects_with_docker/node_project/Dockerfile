# Use an existing docker image as base
From centos:7

# Download and install Node.js
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum install -y nodejs

# Copy the package.json from your work directory to the container's work directory
# Until we copy the package.json file to container work directory, npm install will not work
COPY ./package.json .

# Install node dependencies
RUN npm install

# Copy the source code from your work directory to the container's work directory
COPY ./ ./

# Exposing port 8000 on the container. This is the port where Node.js application is running
EXPOSE 8000

# Startup Command
CMD ["npm", "start"]
