echo "Update Waybar for new Gurt menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  gurt-refresh-waybar
fi
