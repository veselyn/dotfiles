let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_bash_linters', ['shellcheck'])

let b:ale_fixers = get(g:, 'ale_bash_fixers', ['shfmt'])
