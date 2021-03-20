if [ ! -e ~/antigen.zsh ]; then
  curl -L git.io/antigen > ~/antigen.zsh
  sleep 2
fi

source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle aws
antigen bundle catimg
antigen bundle colored-man-pages
antigen bundle docker
antigen bundle docker-compose
antigen bundle fzf
antigen bundle git
antigen bundle item2
antigen bundle ng
antigen bundle npm
antigen bundle npx
antigen bundle osx
antigen bundle tmux
antigen bundle vi-mode
antigen bundle yarn

antigen theme avit

CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"

ZSH_DISABLE_COMPFIX=true

antigen apply

source ~/.path
source ~/.exports
source ~/.aliases
source ~/.functions
source ~/.extra
source ~/.fzf.zsh

bindkey jj vi-cmd-mode 

stty -ixon

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
