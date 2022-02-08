# ____________fish

starship init fish | source                         # use starship prompt
fish_vi_key_bindings                                # use vim keybinds

bass source "$HOME/.bashrc"
set SHELL "/usr/bin/fish"

# fzf

set fzf_preview_dir_cmd exa --all --color=always    # use exa 
set fzf_fd_opts --hidden --exclude=.git             # search hidden files



# ____________aliases

alias l="exa -la"
alias dir="ranger"
alias ports="sudo lsof -i -P -n | grep LISTEN"


# ____________env

set EDITOR "/usr/bin/nvim"
set SUDO_EDITOR "$EDITOR"

set PATH "$HOME/.local/bin:$PATH"


#____________flutter snap
set PATH "$HOME/snap/flutter/common/flutter:$PATH"


# ____________rust

set PATH "$HOME/.cargo/bin:$PATH"

# wasmtime

set WASMTIME_HOME "$HOME/.wasmtime"
string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

# wasmer

export WASMER_DIR="/home/aniket/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"



# ____________node

# yarn

set PATH "$HOME/.yarn/bin:$PATH"

# deno

set DENO_INSTALL "$HOME/.deno"
set PATH "$DENO_INSTALL/bin:$PATH"



# ____________andorid

set ANDROID_SDK_ROOT "$HOME/Android/Sdk"
set PATH "$HOME/Android/Sdk/platform-tools:$PATH"



# ____________flatpak

