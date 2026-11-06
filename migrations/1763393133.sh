echo "Link new theme picker config"

mkdir -p ~/.config/elephant/menus
ln -snf $GURT_PATH/default/elephant/gurt_themes.lua ~/.config/elephant/menus/gurt_themes.lua
sed -i '/"menus",/d' ~/.config/walker/config.toml
gurt-restart-walker
