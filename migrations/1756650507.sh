echo "Fix JetBrains font setting"

if [[ $(gurt-font-current) == JetBrains* ]]; then
  gurt-font-set "JetBrainsMono Nerd Font"
fi
