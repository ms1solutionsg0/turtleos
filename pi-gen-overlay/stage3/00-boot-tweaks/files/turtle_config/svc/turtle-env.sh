#!/bin/bash

function generate_hostapd() {

  eval "echo \"$(cat $working_dir/../templates/hostapd.tmpl)\""

}

working_dir="$(dirname "$0")"

source "$working_dir/../rover.conf"

echo "TURTLE_WLAN_CONFIGURATION: SSID: $ROVER_WLAN_SSID, CHANNEL: $ROVER_WLAN_CHANNEL, PWD: ******"

systemd-notify --status="Generating config files..."

generate_hostapd > "/etc/hostapd/hostapd.conf"

systemd-notify --status="Environment prepared."

systemd-notify --ready


exit 0