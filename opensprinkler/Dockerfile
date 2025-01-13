FROM debian:bullseye

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    git build-essential curl libcurl4-openssl-dev \
    libssl-dev zlib1g-dev libjson-c-dev

# Clone OpenSprinkler Firmware
WORKDIR /opt
RUN git clone --recurse-submodules https://github.com/OpenSprinkler/OpenSprinkler-Firmware.git

# Change directory to firmware folder
WORKDIR /opt/OpenSprinkler-Firmware

# Build the firmware for demo mode
RUN ./build.sh -s demo

# Expose OpenSprinkler's default ports
EXPOSE 80

# Set the entrypoint to the OpenSprinkler binary
ENTRYPOINT ["/opt/OpenSprinkler-Firmware/startOpenSprinkler.sh"]

