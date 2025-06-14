# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Structure

This is a personal Neovim configuration using Packer as the plugin manager. The configuration follows a modular structure:

- `init.lua` - Entry point that requires the main `noe` module
- `lua/noe/` - Main configuration modules:
  - `init.lua` - Loads all sub-modules and sets up auto-formatting/linting
  - `packer.lua` - Plugin definitions and configuration
  - `remap.lua` - Custom key mappings with `,` as leader key
  - `set.lua` - Vim options and settings
- `after/plugin/` - Plugin-specific configurations loaded after plugins

## Key Configuration Details

### Leader Key
- Leader key is set to `,` (comma)
- Special escape mapping: `<leader>;` exits any mode

### Package Management
- Uses Packer.nvim for plugin management
- Plugins are defined in `lua/noe/packer.lua`
- Run `:PackerSync` to install/update plugins

### LSP Setup
- Uses lsp-zero for simplified LSP configuration
- Mason manages LSP servers automatically
- Configured language servers: lua_ls, pyright, ts_ls, rust_analyzer, volar
- Format on save using Conform.nvim with auto-format for multiple languages

### Code Formatting
- Conform.nvim handles formatting with these formatters:
  - Lua: stylua
  - Python: isort + black
  - Rust: rustfmt
  - JavaScript: prettierd/prettier
- Automatic formatting on save via `BufWritePre` autocmd

### File Indentation
- Default: 4 spaces
- JavaScript/TypeScript/JSON/HTML/CSS/YAML/Vue: 2 spaces (via autocmd)

### Key Plugins
- Telescope for fuzzy finding (`<leader>pf`, `<C-p>`, `<leader>ps`)
- NvimTree file explorer (`<leader><Tab>`)
- Treesitter for syntax highlighting with folding
- Fugitive for Git integration
- Avante.nvim (AI assistant - requires `make` build)
- Codeium for AI completion
- Noice.nvim for enhanced UI

### Python Development
- Custom `<leader>r` mapping runs current Python file in new terminal tab
- Activates virtual environment automatically

### Terminal Integration
- Uses tmux integration (`<C-f>` opens tmux-sessionizer)
- Built-in terminal support for Python execution

## Common Tasks

When working with this configuration:
1. Use `:PackerSync` to manage plugins
2. LSP servers install automatically via Mason
3. Formatting happens on save - no manual intervention needed
4. Use `<leader>pf` for file finding, `<leader>ps` for text search
5. Python files can be run directly with `<leader>r`