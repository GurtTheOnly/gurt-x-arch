echo "Install swayOSD to show volume status"

if gurt-cmd-missing swayosd-server; then
  gurt-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi
