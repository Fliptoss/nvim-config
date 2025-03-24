# Vim/Neovim Configuration

This repository contains my personal Vim/Neovim configuration built with [vim-plug](https://github.com/junegunn/vim-plug) for managing plugins. It is designed to enhance the coding experience by providing useful features such as file navigation, auto-completion, LSP integration, syntax highlighting, and a custom dashboard.

## Features

- **Enhanced UI & Navigation**
  - Line numbering (absolute and relative)
  - NERDTree for file system exploration
  - Tagbar for code navigation
  - Custom key mappings for quick file and window switching

- **Editing Enhancements**
  - Auto-indentation and smart tab settings
  - Surround, commenting, and visual multi-cursor support
  - Auto-closing of brackets/quotes via nvim-autopairs

- **Fuzzy Finding & Search**
  - Telescope for fuzzy file search, live grep, and buffer management

- **Syntax Highlighting & Code Folding**
  - Treesitter for advanced syntax highlighting, indentation, incremental selection, and code folding

- **Language Server Protocol (LSP) Integration**
  - Pyright for Python language support
  - Custom key mappings for definition, hover, and code actions
  - Autocompletion setup using nvim-cmp and related sources

- **Status Line & Dashboard**
  - vim-airline and lualine for an enhanced status bar
  - Alpha-nvim provides a customizable startup dashboard with ASCII art and quick-access buttons

## Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/Fliptoss/nvim-config.git
   cd nvim-config
