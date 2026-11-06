echo "Install socat so we can reactivate internal display when external display is removed"

gurt-pkg-add socat
uwsm-app -- gurt-hyprland-monitor-watch &
