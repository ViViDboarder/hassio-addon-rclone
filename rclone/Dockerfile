ARG BUILD_FROM=homeassistant/aarch64-base
FROM $BUILD_FROM

ENV LANG C.UTF-8

ARG BUILD_ARCH=aarch64
ARG VERSION=v1.55.1

# Install rclone
COPY install_rclone.sh /
RUN /install_rclone.sh "${VERSION}" "${BUILD_ARCH}"

# Add timegaps for pruning backups
RUN apk add python3=3.9.5-r2 py3-pip=20.3.4-r1
RUN pip install timegaps==0.1.1

ENV XDG_CONFIG_HOME=/data

COPY rootfs /
