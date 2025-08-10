gtc() {
  git add .
  git commit -m "$1"
}

gtp() {
  gtc "$1"
  git pull
  git push -f
}

nvd() {
  DIR="$(zoxide query "$1")" && nvim -c "cd ${DIR}"
}

clip() {
  xclip -selection clipboard <"$1"
}

alias ls='lsd'
alias ll='ls -l'
alias la='ll -A'
alias lr='ls -tR'
alias lt='ll -t'

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

alias cls='clear'
alias catf='bat'
alias vim='nvim'
