# Install all base packages
mapfile -t packages < <(grep -v '^#' "$GURT_INSTALL/gurt-base.packages" | grep -v '^$')
gurt-pkg-add "${packages[@]}"
