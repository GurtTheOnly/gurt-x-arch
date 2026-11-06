echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/gurt/themes/hackerman ]]; then
  rm -rf ~/.config/gurt/themes/hackerman
  ln -nfs ~/.local/share/gurt/themes/hackerman ~/.config/gurt/themes/
fi
