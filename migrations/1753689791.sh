echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/gurt/themes/ristretto ]]; then
  ln -nfs ~/.local/share/gurt/themes/ristretto ~/.config/gurt/themes/
fi
