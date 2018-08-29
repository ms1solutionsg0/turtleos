#!/bin/bash -e

echo "=> Retrieving latest TCS..."
wget -q $(wget -q -O -  'https://api.github.com/repos/TurtleRover/tcs/releases/latest' | jq -r '.assets[0].browser_download_url') -O ./tcs.deb

apt install ./tcs.deb

echo "=> Removing deb..."
rm ./tcs.deb
