echo "Replace bluetooth GUI with TUI"

gurt-pkg-add bluetui
gurt-pkg-drop blueberry

if ! grep -q "gurt-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/gurt-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi
