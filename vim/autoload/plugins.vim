function! plugins#load() abort
	call s:begin()

	Plug 'airblade/vim-gitgutter'
	Plug 'bkad/camelcasemotion'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'dense-analysis/ale'
	Plug 'easymotion/vim-easymotion'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'honza/vim-snippets'
	Plug 'jiangmiao/auto-pairs'
	Plug 'joshdick/onedark.vim'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'justinmk/vim-sneak'
	Plug 'mattn/emmet-vim'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'rhysd/vim-lsp-ale'
	Plug 'sheerun/vim-polyglot'
	Plug 'sirver/ultisnips'
	Plug 'thomasfaingnaert/vim-lsp-snippets'
	Plug 'thomasfaingnaert/vim-lsp-ultisnips'
	Plug 'tpope/vim-capslock'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-obsession'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-rhubarb'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-vinegar'
	Plug 'vim-scripts/replacewithregister'
	Plug 'vimwiki/vimwiki'
	Plug 'yggdroot/indentline'

	call s:end()
endfunction

function! s:begin() abort
	runtime plugin/onedark.vim

	call plug#begin()
endfunction

function! s:end() abort
	call plug#end()
endfunction
