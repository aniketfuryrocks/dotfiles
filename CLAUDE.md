# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for configuring development environments on Fedora Linux systems (including Fedora Silverblue with toolbox). It contains configuration files and setup scripts for various development tools and terminal utilities.

## Key Setup Scripts

### System Setup
- `./setup_fedora` - Main setup script for Fedora systems, installs terminal utilities and configures shell
- `./setup_dev_toolbox` - Development environment setup for Fedora toolbox containers
- `./setup_lsp` - Installs language servers for various programming languages

### Commands
- `make setup-fedora` - Run Fedora setup
- `make gnome-terminal-config-restore` - Restore GNOME Terminal settings from backup

## Development Environment Configuration

### Shell and Terminal
- **Default Shell**: Fish shell with Oh My Fish framework
- **Terminal Emulator**: Alacritty (config symlinked from `.config/alacritty`)
- **Shell Prompt**: Starship

### Development Tools Installed
- **Editor**: Neovim (config symlinked from `.config/nvim`)
- **Version Control**: Git with lazygit for TUI
- **Package Managers**:
  - Rust: Cargo with custom config from `config.toml`
  - Node.js: NVM (Node Version Manager) and Bun
  - Java/JVM: SDKMAN
- **Search Tools**: ripgrep, fd-find, fzf
- **File Manager**: ranger (config symlinked from `.config/ranger`)

### Programming Languages
- **Rust**: Installed via rustup with cargo tools (cargo-expand, cargo-edit, cargo-update, cargo-watch)
- **Node.js**: Managed through NVM
- **Bun**: JavaScript/TypeScript runtime
- **Python**: System Python with various language servers

## Git Configuration
The setup scripts configure git with:
- User: aniketfuryrocks
- Email: contact@aniketprajapati.me
- Editor: nvim
- Default branch: main

## Toolbox-Specific Setup
For Fedora Silverblue toolbox containers, the setup creates separate home directories per toolbox by modifying `.bashrc` to set:
```bash
HOME="$HOME/.toolbox/homedir/$TOOLBOX_NAME/$USER"
```

## Language Servers (for Neovim)
Installed via `setup_lsp` using yarn:
- TypeScript/JavaScript: typescript-language-server
- CSS: cssmodules-language-server
- Tailwind CSS: tailwindcss-language-server
- Bash: bash-language-server
- Python: pyright
- HTML/JSON: vscode-langservers-extracted