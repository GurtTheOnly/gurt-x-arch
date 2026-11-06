echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/gurt/themes/osaka-jade ]]; then
  rm -rf ~/.config/gurt/themes/osaka-jade
  git -C ~/.local/share/gurt checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/gurt/themes/osaka-jade ~/.config/gurt/themes/osaka-jade
fi
