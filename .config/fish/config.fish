# ____________env

bass export GPG_TTY=$(tty)
set EDITOR "/usr/bin/nvim"
set SUDO_EDITOR "$EDITOR"
set DENO_INSTALL "$HOME/.deno"
set WASMTIME_HOME "$HOME/.wasmtime"
set ANDROID_SDK_ROOT "$HOME/Android/Sdk"

# paths

set PATH "$HOME/.local/bin:$PATH"
set PATH "$HOME/.cargo/bin:$PATH"
set PATH "$HOME/go/bin:$PATH"
set PATH "$HOME/.yarn/bin:$PATH"
set PATH "$HOME/.flutter/bin:$PATH"
set PATH "$DENO_INSTALL/bin:$PATH"
set PATH "$HOME/.local/share/solana/install/active_release/bin:$PATH"
set PATH "$HOME/Android/Sdk/platform-tools:$PATH"


# ____________fish

starship init fish | source                         # use starship prompt
fish_vi_key_bindings                                # use vim keybinds

#bass source "$HOME/.bashrc"

# fzf

set fzf_preview_dir_cmd exa --all --color=always    # use exa 
set fzf_fd_opts --hidden --exclude=.git             # search hidden files


# ____________aliases

alias ls="exa"
alias l="exa -la"
alias dir="ranger"
alias ports="sudo lsof -i -P -n | grep LISTEN"
alias edit="neovide --multigrid" 
alias notes="edit ~/Nextcloud/Notes"

