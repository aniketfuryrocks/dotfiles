# dotfiles

My personal development environment configurations for modern web and systems programming.

## Overview

A curated collection of dotfiles and configurations optimized for:
- **Rust** development with full toolchain
- **JavaScript/TypeScript** with React and modern frameworks
- **Neovim** as primary editor with LSP support
- **Alacritty** GPU-accelerated terminal
- **Fish** shell with productivity enhancements

## Configurations Included

### Neovim
Full IDE experience with:
- LSP configurations for Rust, TypeScript, JavaScript, React (JSX/TSX)
- Language servers for Python, CSS, Tailwind CSS, HTML, JSON
- Integrated debugger support (CodeLLDB for Rust)
- Custom keybindings and productivity plugins

### Alacritty
Fast, GPU-accelerated terminal with:
- Custom color scheme
- Optimized font rendering
- Keybinding configurations

### Shell Environment
**Fish** shell enhanced with:
- **Starship** prompt for git-aware, minimal UI
- **Oh My Fish** plugins (fzf, nvm, z navigation)
- Modern CLI replacements:
  - `exa` → better `ls`
  - `bat` → better `cat`
  - `ripgrep` → better `grep`
  - `fd` → better `find`

### Development Tools

#### Rust
- Complete Rust toolchain via rustup
- Cargo power tools: cargo-expand, cargo-edit, cargo-update, cargo-watch
- Mold linker for faster builds
- CodeLLDB debugger integration

#### JavaScript/TypeScript
- **Bun** - Fast all-in-one JavaScript runtime
- **NVM** - Node.js version management
- Full React/JSX/TSX support
- TypeScript language server with type checking

#### Additional Languages
- Python with Pyright LSP
- Bash with language server
- SDKMAN for JVM languages

## Installation

### Quick Setup

```bash
git clone https://github.com/aniketfuryrocks/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# For standard Fedora systems
./setup_fedora

# For development environment with all tools
./setup_dev_toolbox

# Install language servers for Neovim
./setup_lsp
```

### Toolbox/Container Setup

For Fedora Silverblue or container-based development, the configuration supports isolated environments with separate home directories per toolbox.

## Key Bindings & Workflows

The setup prioritizes:
- **Speed** - Fast startup times, GPU acceleration where possible
- **Modern tooling** - Latest language servers and development tools
- **Keyboard-driven** - Minimal mouse usage with vim motions
- **Git integration** - Lazygit for complex operations, built-in git awareness

## Customization

Personal configurations are set in `setup_dev_toolbox`:
- Git user configuration
- Additional development tools
- Shell aliases and functions

## Structure

```
.dotfiles/
├── .config/
│   ├── alacritty/      # Terminal emulator config
│   ├── fish/            # Shell configurations
│   ├── nvim/            # Neovim setup & plugins
│   └── ranger/          # File manager config
├── config.toml          # Cargo/Rust optimizations
└── setup scripts        # Automated installation
```

## Philosophy

These dotfiles reflect my preference for:
- **Performance** - Native tools, compiled languages, GPU acceleration
- **Modern standards** - LSP, tree-sitter, async operations
- **Simplicity** - Minimal abstractions, direct configurations
- **Developer experience** - Fast feedback loops, intelligent completions

## License

MIT