echo "Change to gurt-nvim package"
gurt-pkg-drop gurt-lazyvim
gurt-pkg-add gurt-nvim

# Will trigger to overwrite configs or not to pickup new hot-reload themes
gurt-nvim-setup
