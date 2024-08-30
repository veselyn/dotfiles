let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_typescriptreact_linters', ['eslint'])

let b:ale_fixers = get(g:, 'ale_typescriptreact_fixers', ['prettier'])
