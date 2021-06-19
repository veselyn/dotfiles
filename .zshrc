export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export LANG="en_US.UTF-8"

export EDITOR="nvim"

source "$HOME/.zsh/aliases"
source "$HOME/.zsh/functions"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git tmux fzf z asdf vscode docker docker-compose)

if type brew &>/dev/null; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
	autoload -Uz compinit
	compinit
fi

source "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH/oh-my-zsh.sh"
