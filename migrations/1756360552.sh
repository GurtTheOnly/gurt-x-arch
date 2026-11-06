echo "Move Gurt Package Repository after Arch core/extra/multilib and remove AUR"

gurt-refresh-pacman
sudo pacman -Syu --noconfirm
