# Use an existing docker image as base
From centos:7

# Download and install dependencies

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum install -y nodejs

COPY ./package.json .

RUN npm install

COPY ./ ./

EXPOSE 8080

# Startup Command
CMD ["node", "server.js"]
