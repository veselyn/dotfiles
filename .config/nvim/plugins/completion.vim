set completeopt=menuone,noinsert,noselect

set shortmess+=c

let g:completion_enable_auto_popup = 0

imap <c-space> <Plug>(completion_trigger)

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

let g:completion_enable_snippet = 'UltiSnips'

let g:completion_confirm_key = ""
imap <expr> <cr> pumvisible() ? complete_info()["selected"] != "-1" ?
                \ "\<Plug>(completion_confirm_completion)" : "\<c-e>\<CR>" : "\<CR>"
