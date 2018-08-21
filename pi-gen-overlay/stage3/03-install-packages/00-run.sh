#!/bin/bash -e

on_chroot <<-EOF
    echo "=> Retrieving latest TCS..."
    curl -L $(curl --silent 'https://api.github.com/repos/TurtleRover/tcs/releases/latest' | jq '.assets[0].browser_download_url') --output tcs.deb

    apt install tcs.deb

    echo "=> Removing deb..."
    rm tcs.deb
EOF
