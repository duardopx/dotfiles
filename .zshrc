
# Path to your oh-my-zsh installation.
export ZSH="/home/nameless/.oh-my-zsh"

if [ "$TMUX" = "" ]; then tmux; fi

# Theme
ZSH_THEME="theunraveler"

# Plugins
plugins=(
    git
    fzf
    tmux
#    ssh-agent
#    zsh-autosuggestions
#    zsh-completions
)
source $ZSH/oh-my-zsh.sh

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

KEYTIMEOUT=1

alias vi="nvim"
alias py="python3"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
