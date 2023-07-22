let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_nix_linters', ['statix'])

let b:ale_fixers = get(g:, 'ale_nix_fixers', ['alejandra'])
