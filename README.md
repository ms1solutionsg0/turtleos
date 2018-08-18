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

## How it works
 * [First of read readme from original pi-gen repo](https://github.com/RPi-Distro/pi-gen)
 1. We are removing original `stage3`, `stage4`, `stage5`
 2. Copying our `stage3` which provides all needed changes to run [Turtle Rover](http://turtlerover.com)

## How to generate Turtle OS
 * Build all stages `sudo ./prebuild.sh`
 * Build only stage3 `sudo ./prebuild.sh -s`
