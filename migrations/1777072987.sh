echo "Fix disable-while-typing on ASUS ROG Flow Z13 detachable keyboard"

source $GURT_PATH/install/config/hardware/asus/fix-z13-touchpad.sh

if [[ -f /etc/udev/rules.d/99-gurt-asus-z13-touchpad.rules ]]; then
  gurt-state set reboot-required
fi
