# Copy over Gurt configs
mkdir -p ~/.config
cp -R ~/.local/share/gurt/config/* ~/.config/

# Use default bashrc from Gurt
cp ~/.local/share/gurt/default/bashrc ~/.bashrc
