#!/bin/bash -e

echo "=> Retrieving latest TCS..."
# wget -q $(wget -q -O -  'https://api.github.com/repos/TurtleRover/tcs/releases/latest' | jq -r '.assets[0].browser_download_url') -O ./tcs.deb

URL=$(curl -sS --header "Authorization: token $GITHUB_TOKEN" \
     --header 'Accept: application/vnd.github.v3.raw' \
     https://api.github.com/repos/TurtleRover/tcs/releases/latest | jq -r '.assets[0].browser_download_url')

mkdir "$ROOTFS_DIR"/tmp/install
curl -L $URL --output "$ROOTFS_DIR"/tmp/install/tcs.deb

on_chroot << EOF
apt install /tmp/install/tcs.deb
EOF
