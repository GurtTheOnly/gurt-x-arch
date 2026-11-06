echo "Use Gurt UWSM session without graphical.target startup wait"

sudo mkdir -p /usr/local/share/wayland-sessions
sudo cp "$GURT_PATH/default/wayland-sessions/gurt.desktop" /usr/local/share/wayland-sessions/gurt.desktop

if [[ -f /etc/sddm.conf.d/autologin.conf ]]; then
  sudo sed -i 's/^Session=hyprland-uwsm$/Session=gurt/' /etc/sddm.conf.d/autologin.conf
fi
