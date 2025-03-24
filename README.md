Here's a comprehensive README.md for your Neovim configuration:

```markdown
# 🚀 NeoVim Configuration

![Neovim Logo](https://neovim.io/logos/neovim-mark-flat.png)

A feature-rich Neovim configuration with IDE-like capabilities, combining popular plugins and custom keybindings for efficient development.

## ✨ Features

- **Modern UI** with `habamax` color scheme (easily switchable)
- **File Explorer**: NERDTree integration
- **Fuzzy Finding**: Telescope-powered file navigation
- **LSP Support**: Pyright setup for Python development
- **Autocompletion**: nvim-cmp with VS Code-like suggestions
- **Syntax Highlighting**: Treesitter-powered code parsing
- **Git Integration**: Built-in git commands and indicators
- **Custom Dashboard**: alpha-nvim startup screen
- **Plugin Manager**: vim-plug for easy plugin management

## ⚙️ Installation

1. **Requirements**:
   - Neovim 0.8+
   - Git 2.40+
   - Node.js 18+ (for LSP servers)
   - Python 3.10+ (for Python LSP)

2. **Backup existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

3. **Clone the repository**:
   ```bash
   git clone https://github.com/Fliptoss/nvim-config.git ~/.config/nvim
   ```

4. **Install plugins**:
   Launch Neovim and run:
   ```vim
   :PlugInstall
   ```

5. **Install LSP Servers** (for Python):
   ```vim
   :LspInstall pyright
   ```

## ⌨️ Key Bindings

### General Navigation
| Key Combination      | Action                          |
|----------------------|---------------------------------|
| `<Space>`            | Leader key                      |
| `<C-h/j/k/l>`        | Window navigation               |
| `<leader>e`          | Toggle NERDTree                 |
| `<leader>f`          | Find file in NERDTree           |
| `<leader>o`          | Focus NERDTree                  |

### Telescope
| Key Combination      | Action                          |
|----------------------|---------------------------------|
| `<leader>ff`         | Find files                      |
| `<leader>fg`         | Live grep                       |
| `<leader>fb`         | Find buffers                    |

### LSP & Code Actions
| Key Combination      | Action                          |
|----------------------|---------------------------------|
| `gd`                 | Go to definition                |
| `gr`                 | Show references                 |
| `K`                  | Hover documentation             |
| `<leader>ca`         | Code actions                    |

### Other
| Key Combination      | Action                          |
|----------------------|---------------------------------|
| `<C-t>`              | Toggle terminal                 |
| `<C-l>`              | Toggle undo tree                |

## 🧩 Plugin Overview

### Core Plugins
- **NERDTree**: File explorer
- **Telescope**: Fuzzy finder
- **nvim-cmp**: Autocompletion
- **Treesitter**: Syntax parsing
- **vim-airline**: Status line
- **alpha-nvim**: Startup dashboard

### Language Support
- **coc.nvim**: Language Server Protocol
- **pyright**: Python LSP
- **nvim-treesitter**: Advanced syntax highlighting

### Utilities
- **vim-surround**: Text manipulation
- **vim-commentary**: Code commenting
- **nvim-autopairs**: Automatic bracket pairing
- **vim-visual-multi**: Multiple cursors

## 🎨 Theming

Current theme: **habamax**  
Available alternatives:
- onedark
- gruvbox
- tokyonight

To change themes:
1. Modify `colorscheme` in init.vim
2. Restart Neovim

## ⚒️ Customization

### Configuration Files
```
nvim/
├── init.vim             # Main configuration
└── lua/                 # Lua configurations
    ├── treesitter.lua
    ├── autopairs.lua
    └── lualine.lua
```

### Plugin Management
- Install new plugins: Add to `plug#begin()` section and run `:PlugInstall`
- Update plugins: `:PlugUpdate`
- Remove plugins: Delete from config and run `:PlugClean`

## 🌟 Tips

1. Use `<C-w>h/l` to switch between NERDTree and editor
2. Run `:Telescope commands` to discover available actions
3. Use `:LspInfo` to check active language servers
4. Customize the dashboard in `alpha.lua` configuration

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## 📄 License

MIT License © 2023 [Your Name]

---

**Happy Coding!** 👨💻  
*Consider starring the repo if you find this useful!*
```

This README includes:
1. Key features and installation instructions
2. Comprehensive keybinding reference
3. Plugin overview and customization guide
4. Theming options and configuration structure
5. Contribution guidelines and license

To complete the README:
1. Replace `[Your Name]` in the license section
2. Add screenshots of your setup
3. Add specific instructions for any custom configurations
4. Include troubleshooting section if needed

Would you like me to add any specific sections or modify existing content?
