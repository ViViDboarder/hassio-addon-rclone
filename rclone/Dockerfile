ARG BUILD_FROM=homeassistant/aarch64-base
FROM $BUILD_FROM

ENV LANG C.UTF-8

ARG BUILD_ARCH=aarch64
ARG VERSION=v1.64.2

# Install rclone
COPY install_rclone.sh /
RUN /install_rclone.sh "${VERSION}" "${BUILD_ARCH}"

# Add timegaps for pruning backups
RUN apk add --no-cache python3 py3-pip jq && \
       pip install --break-system-packages --no-cache-dir timegaps==0.1.1 && \
       apk del py3-pip

ENV XDG_CONFIG_HOME=/data

COPY rootfs /
