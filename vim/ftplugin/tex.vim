let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_tex_linters', ['chktex'])

let b:ale_fixers = get(g:, 'ale_tex_fixers', ['latexindent'])
