echo "Prevent kernel upgrades from making current modules unavailable"

gurt-pkg-add kernel-modules-hook
sudo systemctl enable --now linux-modules-cleanup.service
