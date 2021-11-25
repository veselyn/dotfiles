call plugins#load()

let mapleader = ' '
runtime plugin/onedark.vim
colorscheme onedark

set termguicolors
set hidden
set backup
set swapfile
set undofile
set backupdir=$XDG_DATA_HOME/nvim/backup//
set directory=$XDG_DATA_HOME/nvim/swap//
set undodir=$XDG_DATA_HOME/nvim/undo//
set shortmess-=S
set shortmess+=FIc
set updatetime=100
set signcolumn=yes
set lazyredraw
set number
set relativenumber
set smartindent
set mouse=a
set clipboard=unnamed
set splitbelow
set splitright
set ignorecase
set smartcase
set incsearch
set hlsearch
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set showcmd
