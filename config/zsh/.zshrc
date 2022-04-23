export PATH="$PATH"

export EDITOR='vim'
export LANG='en_US.UTF-8'

export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"
export ZSH="$HOME/.oh-my-zsh"

ZSH_TMUX_AUTOSTART='true'
ZSH_TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"
ZSH_THEME='robbyrussell'

plugins=(
  asdf
  docker
  docker-compose
  fzf
  git
  tmux
  vscode
  z
  macos
  jump
)

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
  autoload -Uz compinit
  compinit -d "$ZSH_COMPDUMP"
fi

source "$ZSH/oh-my-zsh.sh"
source "$ZDOTDIR/aliases.sh"
source '/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/cache"
