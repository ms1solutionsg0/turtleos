#!/bin/bash -e

echo "=> Retrieving latest TCS..."
wget -q $(wget -q -O -  'https://api.github.com/repos/TurtleRover/tcs/releases/latest?access_token=ca84c8b1d578985aa1b954b3f97a1d422027fb3e' | jq -r '.assets[0].browser_download_url') -O ./tcs.deb

apt install ./tcs.deb

echo "=> Removing deb..."
rm tcs.deb
