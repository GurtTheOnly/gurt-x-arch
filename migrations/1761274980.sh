echo "Migrate to proper packages for localsend and asdcontrol"

if gurt-pkg-present localsend-bin; then
  gurt-pkg-drop localsend-bin
  gurt-pkg-add localsend
fi

if gurt-pkg-present asdcontrol-git; then
  gurt-pkg-drop asdcontrol-git
  gurt-pkg-add asdcontrol
fi
