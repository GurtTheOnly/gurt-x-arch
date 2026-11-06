echo "Switch back to mainline chromium now that it supports full live theming"

if gurt-pkg-present gurt-chromium; then
  if gum confirm "Ready to switch to mainstream chromium? (Will close Chromium + reset settings)"; then
    pkill -x chromium
    gurt-pkg-drop gurt-chromium
    gurt-pkg-add chromium
    gurt-theme-set-browser
  fi
fi
