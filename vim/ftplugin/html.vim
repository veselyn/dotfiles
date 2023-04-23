let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_html_linters', [])

let b:ale_fixers = get(g:, 'ale_html_fixers', ['prettier'])
