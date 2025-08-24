# ____________env

bass export GPG_TTY=$(tty)

set --export EDITOR "$(which nvim)"
set --export VISUAL "$(which neovide)"
set --export NEOVIDE_FORK 1
set --export SUDO_EDITOR "$EDITOR"
set --export DENO_INSTALL "$HOME/.deno"
set --export WASMTIME_HOME "$HOME/.wasmtime"
set --export ANDROID_HOME "$HOME/Library/Android/sdk"
set --export BUN_INSTALL "$HOME/.bun"

# tools and language
set  PATH "$HOME/.local/bin:$PATH"
set  PATH "$HOME/.cargo/bin:$PATH"
set  PATH "$HOME/go/bin:$PATH"
set  PATH "$HOME/.yarn/bin:$PATH"
set  PATH "$HOME/.flutter/bin:$PATH"
set  PATH "$HOME/.foundry/bin:$PATH"
set  PATH "$DENO_INSTALL/bin:$PATH"
set  PATH "$HOME/.local/share/solana/install/active_release/bin:$PATH"
set  PATH "$BUN_INSTALL/bin:$PATH"

# android tools
set  PATH "$ANDROID_HOME/platform-tools:$PATH"
set  PATH "$ANDROID_HOME/emulator:$PATH"

# ruby
set  PATH "/opt/homebrew/opt/ruby/bin:$PATH"

# Homebrew
set  PATH "/opt/homebrew/bin:$PATH"
set  PATH "/opt/homebrew/sbin:$PATH"
set  PATH "/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

# For compilers to find ruby you may need to set:
set -gx LDFLAGS "-L/opt/homebrew/opt/ruby/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/ruby/include"


# ____________fish

starship init fish | source                         # use starship prompt
fish_vi_key_bindings                                # use vim keybinds

# bass source "$HOME/.bashrc"

# fzf

set fzf_preview_dir_cmd exa --all --color=always    # use exa 
set fzf_fd_opts --hidden --exclude=.git             # search hidden files
fzf --fish | source                                 # use fzf with fish


# ____________aliases

alias ls="exa"
alias l="exa -la"
alias dir="yazi"
alias ports="sudo lsof -i -P -n | grep LISTEN"
alias edit="neovide --multigrid" 
alias notes="edit ~/Nextcloud/Notes"
alias pinentry="pinentry-mac"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/aniketprajapati/.lmstudio/bin
# End of LM Studio CLI section

set -gx CLAUDE_CODE_DISABLE_TERMINAL_TITLE 0
set -gx CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR 1
