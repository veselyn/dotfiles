let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_svelte_linters', ['eslint'])

let b:ale_fixers = get(g:, 'ale_svelte_fixers', ['prettier'])
