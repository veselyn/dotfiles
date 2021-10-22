source ~/.config/nvim/plugins.vim

colorscheme onedark
let mapleader = ' '

source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/completion.vim
source ~/.config/nvim/plugins/netrw.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/camelcasemotion.vim
source ~/.config/nvim/plugins/ctrlp.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/snippets.vim
source ~/.config/nvim/plugins/indent-blankline.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/autopairs.vim
source ~/.config/nvim/plugins/emmet.vim
source ~/.config/nvim/plugins/highlights.vim
source ~/.config/nvim/plugins/maps.vim

let g:python_host_prog = '~/.local/share/nvim/python/bin/python'
let g:python3_host_prog = '~/.local/share/nvim/python3/bin/python'
let g:ruby_host_prog = '~/.local/share/nvim/ruby/bin/neovim-ruby-host'
let g:node_host_prog = '~/.local/share/nvim/node/.npm/bin/neovim-node-host'

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
