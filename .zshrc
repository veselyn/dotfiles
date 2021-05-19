export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export EDITOR='nvim'

source ~/.zsh/aliases
source ~/.zsh/functions

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git tmux fzf z asdf docker docker-compose)

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    autoload -Uz compinit
    compinit
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
