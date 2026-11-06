echo "Rename lock screen command in Hypridle config"

if grep -q 'gurt-lock-screen' ~/.config/hypr/hypridle.conf; then
  sed -i 's/gurt-lock-screen/gurt-system-lock/g' ~/.config/hypr/hypridle.conf
  gurt-restart-hypridle
fi
