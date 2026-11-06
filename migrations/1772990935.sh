echo "Add sample low battery notification hook"

mkdir -p ~/.config/gurt/hooks/battery-low.d

if [[ ! -f ~/.config/gurt/hooks/battery-low.d/play-warning-sound.sample ]]; then
  cp "$GURT_PATH/config/gurt/hooks/battery-low.d/play-warning-sound.sample" ~/.config/gurt/hooks/battery-low.d/play-warning-sound.sample
fi
