let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_proto_linters', ['buf-lint'])

let b:ale_fixers = get(g:, 'ale_proto_fixers', ['buf-format'])
