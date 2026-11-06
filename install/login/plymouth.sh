if [[ $(plymouth-set-default-theme) != "gurt" ]]; then
  sudo cp -r "$HOME/.local/share/gurt/default/plymouth" /usr/share/plymouth/themes/gurt/
  sudo plymouth-set-default-theme gurt
fi
