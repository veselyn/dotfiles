let g:asyncomplete_auto_popup = 0

imap <Nul> <Plug>(asyncomplete_force_refresh)

call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
\	'name': 'ultisnips',
\	'completor': function('asyncomplete#sources#ultisnips#completor'),
\	'allowlist': ['*']
\}))

call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
\	'name': 'file',
\	'completor': function('asyncomplete#sources#file#completor'),
\	'allowlist': ['*']
\}))

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
\	'name': 'buffer',
\	'completor': function('asyncomplete#sources#buffer#completor'),
\	'allowlist': ['*']
\}))

call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
\	'name': 'tags',
\	'completor': function('asyncomplete#sources#tags#completor'),
\	'allowlist': ['*']
\}))

call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\	'name': 'omni',
\	'completor': function('asyncomplete#sources#omni#completor'),
\	'allowlist': ['*']
\}))
