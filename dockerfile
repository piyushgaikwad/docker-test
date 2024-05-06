# Use an official Alpine Linux as a parent image
FROM alpine:latest

# Set the working directory to /app
WORKDIR /app

# Install git and bash
# Bash is not installed on Alpine by default, and git is needed to clone the repository
RUN apk add --no-cache bash git

# Clone the repository containing the scripts
RUN git clone https://github.com/piyushgaikwad/canner.git /app

# Make all script files executable
RUN find /app -type f -name '*.sh' -exec chmod +x {} \;

# Specify the script to run on container start
ENTRYPOINT ["/app/canner.sh"]
