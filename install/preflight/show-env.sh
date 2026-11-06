# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(GURT_CHROOT_INSTALL|GURT_ONLINE_INSTALL|GURT_USER_NAME|GURT_USER_EMAIL|USER|HOME|GURT_REPO|GURT_REF|GURT_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
