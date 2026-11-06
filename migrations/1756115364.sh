echo "Replace buggy native Zoom client with webapp"

if gurt-pkg-present zoom; then
  gurt-pkg-drop zoom
  gurt-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
