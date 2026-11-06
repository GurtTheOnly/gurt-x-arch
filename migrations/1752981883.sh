echo "Replace wofi with walker as the default launcher"

if gurt-cmd-missing walker; then
  gurt-pkg-add walker-bin libqalculate

  gurt-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/gurt/config/walker/* ~/.config/walker/
fi
