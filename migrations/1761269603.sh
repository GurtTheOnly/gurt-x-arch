echo "Add right-click terminal action to waybar gurt menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && ! grep -A5 '"custom/gurt"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "gurt-menu",/a\    "on-click-right": "gurt-launch-terminal",' "$WAYBAR_CONFIG"
fi
