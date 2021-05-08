source ~/.config/nvim/plugins.vim

let mapleader = ' '

source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/completion.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/telescope.vim

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

let g:netrw_banner = 0
let g:netrw_liststyle = 3
nnoremap <leader>n <cmd>Explore<CR>
nnoremap <leader>sn <cmd>Sexplore<CR>
nnoremap <leader>tn <cmd>Texplore<CR>
nnoremap <leader>vn <cmd>Vexplore<CR>

let g:indent_blankline_char = '|'
let g:indentLine_char = '|'
highlight clear SignColumn

nnoremap \ <cmd>nohlsearch<CR>
