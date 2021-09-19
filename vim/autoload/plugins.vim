function plugins#load()
	call plug#begin()

	Plug 'joshdick/onedark.vim'
	Plug 'vimwiki/vimwiki'
	Plug 'christoomey/vim-tmux-navigator'
	Plug '/usr/local/opt/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-capslock'
	Plug 'tpope/vim-vinegar'
	Plug 'justinmk/vim-sneak'
	Plug 'vim-scripts/replacewithregister'
	Plug 'easymotion/vim-easymotion'
	Plug 'bkad/camelcasemotion'
	Plug 'airblade/vim-gitgutter'
	Plug 'rafamadriz/friendly-snippets'
	Plug 'mattn/emmet-vim'

	call plug#end()
endfunction