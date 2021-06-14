#! /bin/ash
set -ex

VERSION="$1"
ARCH="$2"

# Transform relevant archs
case $ARCH in
armhf)
  ARCH=arm
  ;;
armv7)
  ARCH=arm-v7
  ;;
aarch64)
  ARCH=arm64
  ;;
esac

RCLONE_NAME=rclone-${VERSION}-linux-${ARCH}

# Download
curl -o rclone.zip https://downloads.rclone.org/${VERSION}/${RCLONE_NAME}.zip

# Install
unzip rclone.zip
mv ${RCLONE_NAME}/rclone /usr/local/bin/

# Clean up
rm rclone.zip
rm -fr ${RCLONE_NAME}
