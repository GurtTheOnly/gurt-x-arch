echo "Add flags sourcing to hyprland.conf"

HYPR_CONF=~/.config/hypr/hyprland.conf

source "$GURT_PATH/install/config/gurt-toggles.sh"

if [[ -f $HYPR_CONF ]] && ! grep -q "toggles/hypr/\*\.conf" "$HYPR_CONF"; then
  echo -e "\n# Toggle config flags dynamically\nsource = ~/.local/state/gurt/toggles/hypr/*.conf" >> "$HYPR_CONF"
fi
