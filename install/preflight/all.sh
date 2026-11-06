source $GURT_INSTALL/preflight/guard.sh
source $GURT_INSTALL/preflight/begin.sh
run_logged $GURT_INSTALL/preflight/show-env.sh
run_logged $GURT_INSTALL/preflight/pacman.sh
run_logged $GURT_INSTALL/preflight/migrations.sh
run_logged $GURT_INSTALL/preflight/first-run-mode.sh
run_logged $GURT_INSTALL/preflight/disable-mkinitcpio.sh
