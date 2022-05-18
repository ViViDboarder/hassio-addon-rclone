ARG BUILD_FROM=homeassistant/aarch64-base
FROM $BUILD_FROM

ENV LANG C.UTF-8

ARG BUILD_ARCH=aarch64
ARG VERSION=v1.55.1

# Install rclone
COPY install_rclone.sh /
RUN /install_rclone.sh "${VERSION}" "${BUILD_ARCH}"

# Add timegaps for pruning backups
RUN apk add --no-cache python3~=3.9 py3-pip~=20 && \
       pip install --no-cache-dir timegaps==0.1.1 && \
       apk del py3-pip

ENV XDG_CONFIG_HOME=/data

COPY rootfs /
