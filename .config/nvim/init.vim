source ~/.config/nvim/plugins.vim

colorscheme base16-onedark
let base16colorspace=256
set termguicolors

source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/completion.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/ultisnips.vim
source ~/.config/nvim/plugins/airline.vim

set hidden
set backup
set swapfile
set undofile
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set undodir=~/.local/share/nvim/undo//
set shortmess+=I
set updatetime=100
set noshowmode
set signcolumn=yes
set number
set relativenumber
set mouse=a
set clipboard=unnamed
set splitbelow
set splitright
set ignorecase
set smartcase
set incsearch
set expandtab
set shiftwidth=2
set tabstop=2

map <F1> :Files<CR>
map <F2> :Buffers<CR>
map <F3> :Windows<CR>
map <F4> :NERDTreeToggle<CR>
map <F5> :TagbarToggle<CR>
