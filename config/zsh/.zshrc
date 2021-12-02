export PATH="$HOME/bin:$PATH"

export EDITOR='vim'
export LANG='en_US.UTF-8'

export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='robbyrussell'

plugins=(git tmux fzf z asdf vscode docker docker-compose)

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
  autoload -Uz compinit
  compinit -d "$ZSH_COMPDUMP"
fi

source '/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source "$ZDOTDIR/aliases"
source "$ZSH/oh-my-zsh.sh"

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/cache"
