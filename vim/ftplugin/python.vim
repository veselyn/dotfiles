let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_python_linters', ['flake8'])

let b:ale_fixers = get(g:, 'ale_python_fixers', ['black'])
