let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_yaml_linters', [])

let b:ale_fixers = get(g:, 'ale_yaml_fixers', ['prettier'])
