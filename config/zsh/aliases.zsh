ex() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.*)     tar xavf $1  ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ext()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

gp() {
  git add .
  git commit -m "$1"
  git pull
  git push -f
}

clip() {
  cat $1 | xclip -selection clipboard
}

alias ls='ls --color'
alias ll='ls -lh'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zenv='$EDITOR $HOME/.zshenv'
alias zrc='$EDITOR ${ZDOTDIR:-$HOME}/.zshrc'
alias zals='$EDITOR ${ZDOTDIR:-$HOME}/aliases.zsh'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g C="| clip"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias pkgc='sudo pacman -R $(pacman -Qtdq)'
alias src='source ${ZDOTDIR:-$HOME}/.zshrc; source $HOME/.zshenv'

alias vim='nvim'
alias vi='nvim'
alias c='clear'
alias cat='bat'
alias gcc='clang'
alias g++='clang++'
