echo "Add minimal starship prompt to terminal"

if gurt-cmd-missing starship; then
  gurt-pkg-add starship
  cp $GURT_PATH/config/starship.toml ~/.config/starship.toml
fi
