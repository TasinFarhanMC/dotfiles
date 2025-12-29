HISTSIZE=500
SAVEHIST=$HISTSIZE
HISTDUP=erase
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_history"
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"
source "${ZDOTDIR:-$HOME}/alias.zsh"
source "/usr/share/wikiman/widgets/widget.zsh"

zinit ice depth=1; zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1; zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-posh.toml)"
eval "$(thefuck --alias f)"

bindkey -v
bindkey -M viins '^z' history-search-backward
bindkey -M viins '^x' history-search-forward
bindkey '^[ ' autosuggest-accept

autoload -U compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*:commands" rehash 1

#cowsay -f stegosaurus "Domain Initialized"

# bun completions
[ -s "/home/tasin/.bun/_bun" ] && source "/home/tasin/.bun/_bun"
if [[ -f "/usr/lib/emsdk/emsdk_env.sh" ]]; then
   export EMSDK_QUIET=1
   source "/usr/lib/emsdk/emsdk_env.sh" 
fi
