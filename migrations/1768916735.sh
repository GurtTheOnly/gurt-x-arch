echo "Fix microphone gain and audio mixing on Asus ROG laptops"

source "$GURT_PATH/install/config/hardware/asus/fix-mic.sh"
source "$GURT_PATH/install/config/hardware/asus/fix-audio-mixer.sh"

if gurt-hw-asus-rog; then
  gurt-restart-pipewire
fi
