export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
if [[ `uname` == *"MSYS"* ]]; then
	git config core.editor subl
else
	git config core.editor vim
fi

bindkey -s '^[[25~' ''

alias glol='git log --graph --color --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit | less -R -F -X'
alias gd='git diff | less -F -X -R'
alias ls='ls --color=auto'

if [ "$TMUX" = "" ]; then tmux -2; fi