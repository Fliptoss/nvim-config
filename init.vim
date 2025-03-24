:set number
:set relativenumber
:set mouse=a
:set autoindent
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set smarttab
:set encoding=UTF-8
:set visualbell
:set scrolloff=5
:set fillchars=eob:\ 


call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/preservim/tagbar', {'on': 'TagbarToggle'} " Tagbar for code navigation

Plug 'windwp/nvim-autopairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects' " Advanced text objects
Plug 'nvim-lua/plenary.nvim'         " Required dependency
Plug 'nvim-telescope/telescope.nvim' " Telescope itself

Plug 'https://github.com/navarasu/onedark.nvim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/vim-airline/vim-airline-themes'


Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lualine/lualine.nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'goolord/alpha-nvim'


call plug#end()


nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-p> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :UndotreeToggle<CR>


nnoremap <C-W>tt :TagbarClose<CR>
nnoremap <C-W>t :Tagbar

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"" Commands to remember
"" :Lines -> search lines in open folder
" ":Buffer -> switch between buffers
"" :Files -> Fuzzy files

"" set colorscheme
"" After your plugin declarations:
syntax on
colorscheme habamax " Activate the theme


"Set space as the leader key
let mapleader = " "
nnoremap <leader>e :NERDTreeToggle<CR>

nnoremap <leader>f :NERDTreeFind<CR>

" Focus NERDTree (when already open)
nnoremap <leader>o :NERDTreeFocus<CR>

" Switch between NERDTree and window
" Move to NERDTree (left)
nnoremap <C-h> <C-w>h
"Move back to file (right)
nnoremap <C-l> <C-w>l

:lua << EOF
  require('telescope').setup{}
EOF

nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>

:lua << EOF
require('lualine').setup()
EOF

:lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "python", "javascript", "typescript", "bash", "markdown" }, -- Install parsers for these languages
  highlight = {
    enable = true,              -- Enable syntax highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },   -- Enable indentation
  incremental_selection = {     -- Enable code selection with keymaps
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {               -- Text objects (e.g., `af` for function, `ac` for class)
    enable = true,
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
EOF

:lua << EOF
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
EOF


lua << EOF
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  check_ts = true, -- Use Treesitter to check syntax
})
EOF

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
--      completion = cmp.config.window.bordered(),
--    documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF

lua << EOF
-- Setup Pyright
require('lspconfig').pyright.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Optional: For autocompletion
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- or "basic", "strict"
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      }
    }
  }
})

-- Keybindings for LSP
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == 'pyright' then
      -- Go to definition
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
      -- Hover documentation
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
      -- Code actions
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf })
    end
  end
})
EOF

lua << EOF
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header (ASCII art or text)
dashboard.section.header.val = {
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

-- Buttons (use your existing keybindings)
dashboard.section.buttons.val = {
  dashboard.button("e", "  New File", ":ene <BAR> startinsert<CR>"),
  dashboard.button("<leader>ff", "  Find File", ":Telescope find_files<CR>"),
  dashboard.button("<leader>fg", "  Live Grep", ":Telescope live_grep<CR>"),
  dashboard.button("<leader>fr", "  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Set the config
alpha.setup(dashboard.config)
EOF
