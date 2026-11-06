echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/gurt/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/gurt/themes/flexoki-light ~/.config/gurt/themes/
fi
