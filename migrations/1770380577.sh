echo "Use interactive background selector menu"

mkdir -p ~/.config/elephant/menus
ln -snf $GURT_PATH/default/elephant/gurt_background_selector.lua ~/.config/elephant/menus/gurt_background_selector.lua
gurt-restart-walker
