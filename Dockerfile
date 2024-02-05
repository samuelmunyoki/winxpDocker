# Use the official Ubuntu image as the base image
FROM ubuntu

# Set environment variables (optional)
ENV DEBIAN_FRONTEND=noninteractive

# Update the package lists and install basic utilities
RUN apt-get update && \
    apt-get install -y \
    vim \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set the default command to run when the container starts
CMD ["/bin/bash"]
