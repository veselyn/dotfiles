nnoremap Q @q
nnoremap Y y$
nnoremap <LocalLeader><LocalLeader> <Cmd>nohlsearch<CR>
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"
