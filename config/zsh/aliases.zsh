gp() {
  git add .
  git commit -m "$1"
  git pull
  git push -f
}

clip() {
  cat $1 | xclip -selection clipboard
}

alias ls='lsd'
alias ll='ls -l'
alias la='ll -A'
alias lr='ls -tR'
alias lt='ll -t'

alias zenv='$EDITOR $HOME/.zshenv'
alias zrc='$EDITOR ${ZDOTDIR:-$HOME}/.zshrc'
alias zals='$EDITOR ${ZDOTDIR:-$HOME}/aliases.zsh'

alias grep='grep --color'

alias -g H='2>&1 | head'
alias -g T='2>&1 | tail'
alias -g G='2>&1 | grep'
alias -g L="2>&1 | less"
alias -g M="2>&1 | most"
alias -g C="2>&1 | clip"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias sortnr='sort -n -r'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias vim='nvim'
alias cls='clear'
alias catf='bat'
alias gm='git add . && git commit --amend --no-edit && git push -f'
