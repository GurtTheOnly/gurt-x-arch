echo "Rename screen recording command"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && grep -q 'gurt-capture-screencording' "$WAYBAR_CONFIG"; then
  sed -i 's/gurt-capture-screencording/gurt-capture-screenrecording/g' "$WAYBAR_CONFIG"
  gurt-restart-waybar
fi
