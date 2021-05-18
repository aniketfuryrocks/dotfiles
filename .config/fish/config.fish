alias l="exa -la"
alias dir="ranger"

# env
set EDITOR "nvim"

set -gx WASMTIME_HOME "$HOME/.wasmtime"
set PATH "$HOME/.local/bin:$PATH"
string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

