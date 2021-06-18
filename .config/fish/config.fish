alias l="exa -la"
alias dir="ranger"
alias ports="sudo lsof -i -P -n | grep LISTEN"
# env
set EDITOR "nvim"

set -gx WASMTIME_HOME "$HOME/.wasmtime"
set PATH "$HOME/.local/bin:$PATH"
set PATH "/opt/android_sdk/platform-tools:$PATH"
string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

