# Dockerfile
FROM arm64v8/ubuntu:24.04
LABEL maintainer="fvasquez@gmail.com"
RUN apt-get update && apt-get install -y \
    bluez \
    dbus \
    python3-dbus \
    python3-gi

# Your app code, binaries, or other instructions
COPY . /app
WORKDIR /app

# Example app run
CMD ./entrypoint.sh
