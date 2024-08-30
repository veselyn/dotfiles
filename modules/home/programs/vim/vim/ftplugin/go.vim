let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_go_linters', ['golangci-lint'])

let b:ale_fixers = get(g:, 'ale_go_fixers', ['gofumpt'])
