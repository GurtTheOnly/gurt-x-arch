echo "Ensure all indexes and packages are up to date"

gurt-update-keyring
gurt-refresh-pacman
sudo pacman -Syu --noconfirm
