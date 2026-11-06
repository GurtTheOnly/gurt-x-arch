echo "Add Tmux as an option with themed styling"

gurt-pkg-add tmux

if [[ ! -f ~/.config/tmux/tmux.conf ]]; then
  mkdir -p ~/.config/tmux
  cp $GURT_PATH/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
  gurt-theme-refresh
fi
