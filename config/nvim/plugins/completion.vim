lua require('completion')

set completeopt=menuone,noselect
set shortmess+=c

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +5 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -5 })
