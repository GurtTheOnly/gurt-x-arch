echo "Update Waybar screen recording command"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && grep -q 'gurt-cmd-screenrecord' "$WAYBAR_CONFIG"; then
  sed -i 's/gurt-cmd-screenrecord/gurt-capture-screenrecording/g' "$WAYBAR_CONFIG"
  gurt-restart-waybar
fi
