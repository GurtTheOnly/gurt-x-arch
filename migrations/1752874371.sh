echo "Add Catppuccin Latte light theme"

if [[ ! -L $HOME/.config/gurt/themes/catppuccin-latte ]]; then
  ln -snf ~/.local/share/gurt/themes/catppuccin-latte ~/.config/gurt/themes/
fi
