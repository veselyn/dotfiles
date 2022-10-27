export PATH="$PATH:$HOME/.local/bin"

export EDITOR='vim'
export LANG='en_US.UTF-8'

export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"

ZSH_CUSTOM="$ZDOTDIR/custom"
ZSH_THEME='robbyrussell'
ZSH_TMUX_AUTOSTART='true'
ZSH_TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"

plugins=(
	asdf
	fzf
	git
	jump
	macos
	tmux
	vscode
	web-search
	z
)

if type brew &>/dev/null; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
	autoload -Uz compinit
	compinit -d "$ZSH_COMPDUMP"
fi

source "$ZSH/oh-my-zsh.sh"
source '/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
