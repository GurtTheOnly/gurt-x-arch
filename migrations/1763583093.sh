echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/gurt/themes/ethereal ]]; then
  rm -rf ~/.config/gurt/themes/ethereal
  ln -nfs ~/.local/share/gurt/themes/ethereal ~/.config/gurt/themes/
fi
