echo "Add new Gurt Menu icon to Waybar"

mkdir -p ~/.local/share/fonts
cp ~/.local/share/gurt/config/gurt.ttf ~/.local/share/fonts/
fc-cache
