echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/gurt-cmd-tzupdate/gurt-launch-floating-terminal-with-presentation gurt-tz-select/g' ~/.config/waybar/config.jsonc
