starship init fish | source
fish_vi_key_bindings
alias l="exa -la"
alias dir="ranger"
alias ports="sudo lsof -i -P -n | grep LISTEN"
# env
set EDITOR "nvim"

set WASMTIME_HOME "$HOME/.wasmtime"
set PATH "$HOME/.local/bin:$PATH"
set PATH "$HOME/.cargo/bin:$PATH"

#yarn
set PATH "$HOME/.yarn/bin:$PATH"

# deno
set DENO_INSTALL "$HOME/.deno"
set PATH "$DENO_INSTALL/bin:$PATH"

# android
set ANDROID_SDK_ROOT "$HOME/Android/Sdk"
set PATH "$HOME/Android/Sdk/platform-tools:$PATH"

# flatpak
set XDG_DATA_DIRS "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:~/.local/share/flatpak/exports/share"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

# cd autojump
if test -f /home/aniket/.autojump/share/autojump/autojump.fish; . /home/aniket/.autojump/share/autojump/autojump.fish; end

# Wasmer
export WASMER_DIR="/home/aniket/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
