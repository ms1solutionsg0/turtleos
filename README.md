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

## How to install
Installation procedure is the same as for original Raspbian image which is described [here](https://www.raspberrypi.org/documentation/installation/installing-images/).

## How to connect via SSH
### SSH using Linux or Mac OS
You will need to know your Raspberry Pi's IP address to connect to it. If You're connecting using Turtle Acess Point **Turtle-XXYYY** the adress is static: `10.0.0.1`. You can also connect using Ethernet cable. In this case You have to set in IPv4 settings of Ethernet connection to **Share with other computers** on Your computer. Then, using e.g. `arp`, find address. It usually starts with `10.x.x.x` and is dynamic.

To connect to your Pi from a different computer, copy and paste the following command into the terminal window but replace <IP> with the IP address of the Raspberry Pi. Use Ctrl + Shift + V to paste in the terminal.
  
`ssh pi@<IP>`

If you receive a connection timed out error it is likely that you have entered the wrong IP address for the Raspberry Pi.

When the connection works you will see a security/authenticity warning. Type **yes** to continue. You will only see this warning the first time you connect.

In the event your Pi has taken the IP address of a device to which your computer has connected before (even if this was on another network), you may be given a warning and asked to clear the record from your list of known devices. Following this instruction and trying the ssh command again should be successful.

Next you will be prompted for the password. We are using identical login: `pi` and password: `raspberry`, as official Raspbian.

_Source: [www.raspberrypi.org](https://www.raspberrypi.org/documentation/remote-access/ssh/unix.md)_

### SSH using Windows
For Windows You can follow this [official steps](https://www.raspberrypi.org/documentation/remote-access/ssh/windows.md).
If You're connecting using Turtle Acess Point **Turtle-XXYYY** the adress is static: `10.0.0.1`. 
We are using identical login: `pi` and password: `raspberry`, as official Raspbian.

## How to configure
 * To change HotSpot name (SSID), change `/etc/hostapd/hostapd.conf` file. e.g. using nano `sudo nano /etc/hostapd/hostapd.conf`
 * Works best with RT5370 WiFi adapter, or any that uses `rt2800usb` driver

## Modifications in this image
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
### Network tweaks
 * Patch `hosts`
 * Add systemd network files
    * External wifi interface (hotspot) `wlan0ext`, ip:`10.0.0.1`, default SSID: `TurtleRover-XXYYY`, password: `password`
    * Internal wifi interface `wlan0int`
 * Add custom `wpa_supplicant-wlan0int.conf`
 * Add custom `dnsmasq.conf`
 * Add custom `resolvconf.conf`
 * Add custom `sysctl.conf`
 * Install `dnsmasq`

### Custom software
 * [Turtle Control Software](https://github.com/TurtleRover/tcs)

## How it works
 * [First of read readme from original pi-gen repo](https://github.com/RPi-Distro/pi-gen)
 1. We are removing original `stage3`, `stage4`, `stage5`
 2. Copying our `stage3` which provides all needed changes to run [Turtle Rover](http://turtlerover.com)
 3. Build image

## How to generate Turtle OS
 * Build all stages `sudo ./prebuild.sh`
 * Build only stage3 `sudo ./prebuild.sh -s`

## How to add and edit patches
 * [Using Quilt](https://wiki.debian.org/UsingQuilt)
 * [Quilt Tutorial](http://www.shakthimaan.com/downloads/glv/quilt-tutorial/quilt-doc.pdf)


---
Strongly inspired by 🤡 [BigClown Raspbian](https://github.com/bigclownlabs/bc-raspbian) 🤡
