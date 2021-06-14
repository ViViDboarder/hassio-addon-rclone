ARG BUILD_FROM=homeassistant/aarch64-base
FROM $BUILD_FROM

ENV LANG C.UTF-8

ARG BUILD_ARCH=aarch64
ARG VERSION=v1.55.1

COPY install_rclone.sh /
RUN /install_rclone.sh "${VERSION}" "${BUILD_ARCH}"

ENV XDG_CONFIG_HOME=/data

COPY rootfs /
