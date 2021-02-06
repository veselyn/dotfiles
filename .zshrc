export PATH=$HOME/scripts:$PATH
export JAR=$HOME/.local/share/nvim/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar
export GRADLE_HOME=$HOME/.gradle
export JDTLS_CONFIG=$HOME/.local/share/nvim/jdt-language-server/config_mac
export WORKSPACE=$HOME/workspace
export PATH=/usr/local/opt/llvm/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR='nvim'

alias v='nvim'

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git tmux)

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
kitty + complete setup zsh | source /dev/stdin

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /usr/local/opt/asdf/asdf.sh

. ~/.asdf/plugins/java/set-java-home.zsh
