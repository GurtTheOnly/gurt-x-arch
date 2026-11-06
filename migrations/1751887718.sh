echo "Install Impala as new wifi selection TUI"

if gurt-cmd-missing impala; then
  gurt-pkg-add impala
  gurt-refresh-waybar
fi
