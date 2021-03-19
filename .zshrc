export PATH=$HOME/scripts:$PATH
export GRADLE_HOME=$HOME/.gradle
export WORKSPACE=$HOME/workspace
export JDTLS=$HOME/.local/share/nvim/jdt-language-server
export JDTLS_CONFIG=$JDTLS/config_mac
export JAR=$JDTLS/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar
export PATH=/usr/local/opt/llvm/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR='nvim'

source ~/.zsh/aliases
source ~/.zsh/functions

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git tmux z)

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
kitty + complete setup zsh | source /dev/stdin

source $ZSH/oh-my-zsh.sh
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /usr/local/opt/asdf/asdf.sh

. ~/.asdf/plugins/java/set-java-home.zsh
