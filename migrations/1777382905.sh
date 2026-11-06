echo "Use interactive unlock (Plymouth) selector menu"

mkdir -p ~/.config/elephant/menus
ln -snf $GURT_PATH/default/elephant/gurt_unlocks.lua ~/.config/elephant/menus/gurt_unlocks.lua
gurt-restart-walker
