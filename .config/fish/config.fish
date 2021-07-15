starship init fish | source

alias l="exa -la"
alias dir="ranger"
alias ports="sudo lsof -i -P -n | grep LISTEN"
# env
set EDITOR "nvim"

set -gx WASMTIME_HOME "$HOME/.wasmtime"
set PATH "$HOME/.local/bin:$PATH"
set PATH "$HOME/.cargo/bin:$PATH"
set PATH "/opt/android_sdk/platform-tools:$PATH"
set DENO_INSTALL "$HOME/.deno"
set PATH "$DENO_INSTALL/bin:$PATH"
string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

# cd autojump
if test -f /home/aniket/.autojump/share/autojump/autojump.fish; . /home/aniket/.autojump/share/autojump/autojump.fish; end
