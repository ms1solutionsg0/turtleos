# How to Install
**TurtleOS has a `prebuild.sh` script that won't work**
## Real Steps
1. Make sure to clone repo with `git clone _repo_ --recursive` in order to copy the `pi-gen` folder
2. Clone the `pi-gen` repo into separate directory for later
3. `mkdir build` inside the `turtleos` repo
4. `cd ./build`
5. `cp -rf ../pi-gen/* .`
6. `rm -rf stage2/EXPORT_NOOBS stage2/EXPORT_IMAGE stage3 stage4 stage5`
7. `cp -rf ../pi-gen-overlay/* .`
8. From the separate `pi-gen` repo, copy over the `.git` folder into `./build`
9. `./build-docker`

## Possible issues

### APT-GET Hash Mismatches
This is a weird proxy issue
1. `cp badproxy ./build`
2. Add `COPY ./badproxy /etc/apt/apt.conf.d/99fixbadproxy` to the Dockerfile before the `RUN` command
3. Restart

### Not a git directory
1. From the separate `pi-gen` repo, copy over the `.git` directory to `./build` 

### Not pulling latest version of TCS
The `.deb` is hardcoded into `stage3/10-install-tcs/00-run.sh`
1. Go to the `TurtleRover/tcs` deployments page
2. Copy the link for the `.deb` deployment you want
3. Replace the `URL` in the above file with your new URL
4. Re-run the `./build-docker` script


## Configuration
This is the base image for TurtleRover. Multiple configurations can be set before the image creation that should be done carefully before multiple SD cards are written.

### Wifi
Modify the SSID and password at 
`pi-gen-overlay/stage3/02-net-tweaks/files/etc/hostapd/hostapd.conf`

### uv4l
`pi-gen-overlay/stage3/01-sys-tweaks/files/etc/uv4l/uv4l-uvc.conf`

### TCS version
Update with correct path at 
`pi-gen-overlay/stage3/10-install-tcs/00-run.sh`