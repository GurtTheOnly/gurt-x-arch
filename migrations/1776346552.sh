echo "Enable Bluetooth A2DP auto-connect in WirePlumber"

destination=~/.config/wireplumber/wireplumber.conf.d/bluetooth-a2dp-autoconnect.conf

mkdir -p ~/.config/wireplumber/wireplumber.conf.d/

if [[ ! -f "$destination" ]]; then
  cp "$GURT_PATH/default/wireplumber/wireplumber.conf.d/bluetooth-a2dp-autoconnect.conf" \
    "$destination"
fi

gurt-state set reboot-required
