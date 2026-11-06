echo "6Ghz Wi-Fi + Intel graphics acceleration for existing installations"

bash "$GURT_PATH/install/config/hardware/set-wireless-regdom.sh"
bash "$GURT_PATH/install/config/hardware/intel/video-acceleration.sh"
