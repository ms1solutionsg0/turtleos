<p align="center">
  <a href="http://turtlerover.com" alt="Turtle Rover"><img src="https://avatars3.githubusercontent.com/u/36553642?s=84&v=4" alt="Turtle Rover" /></a>
</p>
<h1 align="center">Turtle OS</h1>
<h4 align="center">Modificated Raspbian Lite</h4>

<p align="center">
  <a href="https://travis-ci.org/TurtleRover/turtleos">
    <img src="https://travis-ci.org/TurtleRover/turtleos.svg?branch=master" alt="Build Status">
  </a>
  <a href="https://github.com/TurtleRover/turtleos/releases">
    <img src="https://img.shields.io/github/release/TurtleRover/turtleos.svg" alt="Release"></a>
  <a href="https://github.com/TurtleRover/turtleos/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/TurtleRover/turtleos.svg">
  </a>
  <a href="https://twitter.com/TurtleRover">
    <img src="https://img.shields.io/twitter/follow/TurtleRover.svg?style=social&label=Follow">
  </a>
</p>
<p align="center">
  <a href="http://turtlerover.com" alt="Website">Website</a> |
  <a href="https://www.facebook.com/TurtleRover/" alt="Facebook">Facebook</a> |
  <a href="https://www.youtube.com/channel/UCxukvEct3wP0S5FACa3uelA" alt="YouTube">YouTube</a>
</p>

## Changes
### Boot tweaks
 * Patch `cmdline.txt`: disable repair, disable serial0
 * Patch `config.txt`: enable uart, disable splash
 * Add `ssh` file by default
 * Turtle Rover configs
### System tweaks
 * Patch sshd to disallow client to pass locale environment variables
 * Add custom `hostapd.service`
 * Add `turtle.service`
 * Install `hostapd`
 * Install `uv4l` and custom config
 * ⚠️ **Add `www-data` to `sudoers`**
### Network tweaks
 * Patch `hosts`
 * Add systemd network files. Configure external wifi, internal wifi and ethernet
 * Add custom `wpa_supplicant-wlan0int.conf`
 * Add custom `dnsmasq.conf`
 * Add custom `resolv.conf`
 * Add custom `sysctl.conf`
 * Install `dnsmasq`
 
### Install custom software
 * Install `jq python3-pip wiringpi`
 * Install [`tcs`](https://github.com/TurtleRover/tcs)

## How it works
 * [First of read readme from original pi-gen repo](https://github.com/RPi-Distro/pi-gen)
 1. We are removing original `stage3`, `stage4`, `stage5`
 2. Copying our `stage3` which provides all needed changes to run [Turtle Rover](http://turtlerover.com)
 3. Run original `build.sh` script

## How to generate Turtle OS
 * Build all stages `sudo ./prebuild.sh`
 * Build only stage3 `sudo ./prebuild.sh -s`
