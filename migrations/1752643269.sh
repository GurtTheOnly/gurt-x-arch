echo "Add new matte black theme"

if [[ ! -L $HOME/.config/gurt/themes/matte-black ]]; then
  ln -snf ~/.local/share/gurt/themes/matte-black ~/.config/gurt/themes/
fi
