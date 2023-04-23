let b:ale_enabled = 1

let b:ale_linters = get(g:, 'ale_lua_linters', ['luacheck'])

let b:ale_fixers = get(g:, 'ale_lua_fixers', ['stylua'])
