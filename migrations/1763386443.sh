echo "Uniquely identify terminal apps with custom app-ids using gurt-launch-tui"

# Replace terminal -e calls with gurt-launch-tui in bindings
sed -i 's/\$terminal -e \([^ ]*\)/gurt-launch-tui \1/g' ~/.config/hypr/bindings.conf

# Update waybar to use gurt-launch-or-focus with gurt-launch-tui for TUI apps
sed -i 's|xdg-terminal-exec btop|gurt-launch-or-focus-tui btop|' ~/.config/waybar/config.jsonc
sed -i 's|xdg-terminal-exec --app-id=com\.gurt\.Wiremix -e wiremix|gurt-launch-or-focus-tui wiremix|' ~/.config/waybar/config.jsonc
