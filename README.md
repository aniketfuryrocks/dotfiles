# dotfiles
My arch bspwm dotfiles

use `make_dev_toolkit` inside fedora silver blue toolkit

change `.bashrc` to create a separate Home dir for toolkit
~~~.bash
TOOLBOX_NAME=""
if [ -f "/run/.containerenv" ]; then
        TOOLBOX_NAME=$(sed -nr 's/^name="(.*)"$/\1/p' /run/.containerenv)
        HOME="$HOME/.toolbox/homedir/$TOOLBOX_NAME/$USER"
        mkdir -p "$HOME"
fi
~~~
