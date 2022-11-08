#!/usr/bin/env zsh

alias v='vim'
alias vd='vimdiff'
alias vss='vim -S Session.vim'

alias r='ranger'

alias gai='git add --interactive'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip--"'

alias yay='brew update && brew upgrade'
alias c='pbcopy'
alias p='pbpaste'
