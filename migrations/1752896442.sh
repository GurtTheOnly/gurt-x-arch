echo "Replace volume control GUI with a TUI"

if gurt-cmd-missing wiremix; then
  gurt-pkg-add wiremix
  gurt-pkg-drop pavucontrol
  gurt-refresh-applications
  gurt-refresh-waybar
fi
