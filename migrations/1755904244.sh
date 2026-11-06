echo "Update fastfetch config with new Gurt logo"

gurt-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/gurt/branding
cp $GURT_PATH/icon.txt ~/.config/gurt/branding/about.txt
