let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_sql_linters', ['sqlfluff'])

let b:ale_fixers = get(g:, 'ale_sql_fixers', ['sqlfluff'])
