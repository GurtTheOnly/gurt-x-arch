echo "Add UWSM env"

export GURT_PATH="$HOME/.local/share/gurt"
export PATH="$GURT_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
cat <<EOF | tee "$HOME/.config/uwsm/env"
export GURT_PATH=$HOME/.local/share/gurt
export PATH=$GURT_PATH/bin/:$PATH
EOF

# Ensure we have the latest repos and are ready to pull
gurt-update-keyring
gurt-refresh-pacman
sudo systemctl restart systemd-timesyncd
sudo pacman -Sy # Normally not advisable, but we'll do a full -Syu before finishing

mkdir -p ~/.local/state/gurt/migrations
touch ~/.local/state/gurt/migrations/1751134560.sh

# Remove old AUR packages to prevent a super lengthy build on old Gurt installs
gurt-pkg-drop zoom qt5-remoteobjects wf-recorder wl-screenrec

# Get rid of old AUR packages
bash $GURT_PATH/migrations/1756060611.sh
touch ~/.local/state/gurt/migrations/1756060611.sh

bash gurt-update-perform
