echo "Switch lmstudio -> lmstudio-bin"

if pacman -Q lmstudio &>/dev/null; then
  gurt-pkg-drop lmstudio
  gurt-pkg-add lmstudio-bin
fi
