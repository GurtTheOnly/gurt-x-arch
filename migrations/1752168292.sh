echo "Enable battery low notifications for laptops"

if ls /sys/class/power_supply/BAT* &>/dev/null && [[ ! -f ~/.local/share/gurt/config/systemd/user/gurt-battery-monitor.service ]]; then
  mkdir -p ~/.config/systemd/user

  cp ~/.local/share/gurt/config/systemd/user/gurt-battery-monitor.* ~/.config/systemd/user/

  systemctl --user daemon-reload
  systemctl --user enable --now gurt-battery-monitor.timer || true
fi
