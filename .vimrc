call plug#begin()

Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'dense-analysis/ale'

call plug#end()

set clipboard=unnamed

set hidden
set updatetime=100
set shortmess+=c

set termguicolors
syntax on
colorscheme onedark

set noshowmode
set showcmd
set shortmess+=F

set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

set splitbelow
set splitright

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

map <F4> :NERDTreeToggle<CR>

let g:NERDSpaceDelims = 1

nmap <F5> :TagbarToggle<CR>

map <F1> :Files<CR>
map <F2> :Buffers<CR>
map <F3> :Windows<CR>

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gy <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    " nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    " nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>qf <plug>(lsp-code-action)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
  \ 'name': 'ultisnips',
  \ 'allowlist': ['*'],
  \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
\ }))

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)
nmap <silent> <leader>f <Plug>(ale_fix)
nmap <silent> <leader>l <Plug>(ale_lint)

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint', 'prettier'],
  \ 'javascriptreact': ['eslint', 'prettier'],
  \ 'typescript': ['eslint', 'prettier'],
  \ 'typescriptreact': ['eslint', 'prettier'],
  \ 'html': ['prettier'],
  \ 'css': ['prettier'],
  \ 'less': ['prettier'],
  \ 'sass': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'json': ['prettier'],
  \ 'yaml': ['prettier'],
  \ 'markdown': ['prettier'],
\ }

let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
