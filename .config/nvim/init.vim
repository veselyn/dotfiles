source ~/.config/nvim/plugins.vim

let mapleader = ' '

set termguicolors

source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/saga.vim
source ~/.config/nvim/plugins/completion.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/tagbar.vim

let g:python_host_prog = '~/.local/share/nvim/python/bin/python'
let g:python3_host_prog = '~/.local/share/nvim/python3/bin/python'
let g:ruby_host_prog = '~/.local/share/nvim/ruby/bin/neovim-ruby-host'
let g:node_host_prog = '~/.local/share/nvim/node/.npm/bin/neovim-node-host'

set hidden
set backup
set swapfile
set undofile
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set undodir=~/.local/share/nvim/undo//
set shortmess+=I
set updatetime=100
set signcolumn=yes
set number
set relativenumber
set mouse=a
set clipboard=unnamedplus
set splitbelow
set splitright
set ignorecase
set smartcase
set incsearch
set expandtab
set shiftwidth=2
set tabstop=2

let g:indent_blankline_char = '│'
let g:indentLine_char = '│'

nnoremap \ <cmd>nohlsearch<CR>
