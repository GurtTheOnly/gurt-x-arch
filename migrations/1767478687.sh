echo "Add opencode with system theming"

gurt-pkg-add opencode

# Add config using gurt theme by default
if [[ ! -f ~/.config/opencode/opencode.json ]]; then
  mkdir -p ~/.config/opencode
  cp $GURT_PATH/config/opencode/opencode.json ~/.config/opencode/opencode.json
fi
