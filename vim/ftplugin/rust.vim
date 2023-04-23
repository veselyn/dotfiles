let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_rust_linters', ['cargo'])

let b:ale_fixers = get(g:, 'ale_rust_fixers', ['rustfmt'])

let g:ale_rust_cargo_use_clippy = 1
