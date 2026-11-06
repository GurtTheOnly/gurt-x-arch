# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
# Run gurt-restart-xcompose to apply changes

# Include fast emoji access
include "%H/.local/share/gurt/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$GURT_USER_NAME"
<Multi_key> <space> <e> : "$GURT_USER_EMAIL"
EOF
