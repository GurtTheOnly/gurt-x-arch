echo "Add sample post-boot hook"

mkdir -p ~/.config/gurt/hooks/post-boot.d

if [[ ! -f ~/.config/gurt/hooks/post-boot.d/weather.sample ]]; then
  cp "$GURT_PATH/config/gurt/hooks/post-boot.d/weather.sample" ~/.config/gurt/hooks/post-boot.d/weather.sample
fi
