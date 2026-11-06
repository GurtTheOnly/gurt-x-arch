#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Gurt locations
export GURT_PATH="$HOME/.local/share/gurt"
export GURT_INSTALL="$GURT_PATH/install"
export GURT_INSTALL_LOG_FILE="/var/log/gurt-install.log"
export PATH="$GURT_PATH/bin:$PATH"

# Install
source "$GURT_INSTALL/helpers/all.sh"
source "$GURT_INSTALL/preflight/all.sh"
source "$GURT_INSTALL/packaging/all.sh"
source "$GURT_INSTALL/config/all.sh"
source "$GURT_INSTALL/login/all.sh"
source "$GURT_INSTALL/post-install/all.sh"
