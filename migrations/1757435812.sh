echo "Update Zoom webapp to handle zoommtg:// and zoomus:// protocol links"

if [[ -f ~/.local/share/applications/Zoom.desktop ]]; then
  gurt-webapp-remove Zoom
  gurt-webapp-install Zoom https://app.zoom.us/wc/home Zoom.png "gurt-webapp-handler-zoom %u" "x-scheme-handler/zoommtg;x-scheme-handler/zoomus"
fi
