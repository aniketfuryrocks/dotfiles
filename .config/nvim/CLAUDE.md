# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a comprehensive Neovim configuration using Lazy.nvim as the package manager. The configuration is structured into modular Lua files in the `lua/` directory, each handling specific functionality.

## Core Architecture

### Package Management
- Uses Lazy.nvim (`lazy-lock.json` tracks plugin versions)
- Plugins are defined in `lua/plugins.lua`
- All plugins are loaded through `lua/package-manager.lua`

### Configuration Structure
- `init.lua` - Entry point that requires all modules
- `lua/bindings.lua` - All keybindings with helper functions
- `lua/lsp.lua` - LSP configuration with Mason integration
- `lua/debg.lua` - Debug Adapter Protocol (DAP) configuration

### Key Components

#### LSP Configuration (`lua/lsp.lua`)
- Comprehensive LSP setup with 20+ language servers
- Mason integration for automatic LSP installation
- Custom on_attach function with buffer-local keybindings
- Inlay hints enabled by default
- Format on save enabled
- Custom diagnostic configuration with icons

#### Debugging (`lua/debg.lua`)
- DAP configuration for C/C++ using CodeLLDB
- Automatic UI opening/closing with nvim-dap-ui
- Virtual text display for debug information
- Integrates with nvim-notify for debug session notifications

#### Key Bindings (`lua/bindings.lua`)
- Space as leader key
- Telescope integration for file finding and LSP navigation
- Debug keybindings with `<leader>d` prefix
- Git integration with `<leader>g` prefix
- Buffer navigation with `]b` and `[b`

## Common Development Commands

### Setup
```bash
# Install LSP servers (legacy script)
./setup_lsp
```

### Key Plugin Commands
- `:Lazy` - Open Lazy.nvim package manager
- `:Mason` - Open Mason LSP installer
- `:LspInfo` - Show LSP client information
- `:LspRestart` - Restart LSP clients

### Debug Commands
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue debugging
- `<leader>dn` - Step over
- `<leader>di` - Step into

### File Navigation
- `<leader>ff` - Find files with Telescope
- `<leader>fg` - Live grep with Telescope
- `<leader>fb` - Browse buffers
- `<leader>tt` - Toggle NvimTree

### LSP Navigation
- `<leader>gd` - Go to definition
- `<leader>fr` - Find references
- `<leader>rn` - Rename symbol
- `<leader>fmt` - Format code
- `<Alt-CR>` - Code actions

## Language Support

### Currently Configured Languages
- TypeScript/JavaScript (ts_ls, eslint)
- Python (pyright)
- Go (gopls)
- C/C++ (clangd)
- Lua (lua_ls)
- HTML/CSS (html, cssls, tailwindcss)
- Docker (dockerls)
- Markdown (marksman)
- And many more (see `servers` table in `lua/lsp.lua`)


## Important Notes

- Mason handles automatic LSP installation
- Format on save is enabled for all LSP-capable buffers
- Inlay hints are enabled globally
- The configuration uses rounded borders for LSP hover/signature help
- Debug sessions automatically close file tree and open debug UI
- All keybindings use `noremap` and `silent` by default

## File Structure to Know

When adding new functionality:
- Add keybindings to `lua/bindings.lua`
- Add plugins to `lua/plugins.lua`
- Language-specific configs go in separate files
- Require new modules in `init.lua`

The configuration follows a modular approach where each feature is contained in its own file and imported through the main `init.lua`.