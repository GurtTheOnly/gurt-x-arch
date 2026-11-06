echo "Change gurt-screenrecord to use gpu-screen-recorder"
gurt-pkg-drop wf-recorder wl-screenrec

# Add slurp in case it hadn't been picked up from an old migration
gurt-pkg-add slurp gpu-screen-recorder
