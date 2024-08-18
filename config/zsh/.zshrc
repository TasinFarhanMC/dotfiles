HISTSIZE=500
SAVEHIST=$HISTSIZE
HISTDUP=erase
HISTFILE="${XDG_CACHE_HOME:-${HOME/.cache}}/zsh_history"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME/.local/share}}/zinit"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p $(dirname $ZINIT_HOME)
  git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
fi

source "$ZINIT_HOME/zinit.zsh"
source "${ZDOTDIR:-$HOME}/aliases.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

autoload -U compinit && compinit -d "${XDG_CACHE_HOME:-${HOME/.cache}}/zcompdump"

eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME:-${HOME/.config}}/oh-my-posh/oh-my-posh.toml)"
eval "$(thefuck --alias f)"

bindkey -v
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' forward-delete-char
bindkey -M viins '^k' history-search-forward
bindkey -M viins '^j' history-search-backward
bindkey -M vicmd 'k' history-search-forward
bindkey -M vicmd 'j' history-search-backward
bindkey '^@' autosuggest-accept

reload_rc() {
  echo "Reloading..."
  src
  zle reset-prompt
}

zle -N reload_rc reload_rc
bindkey '^T' reload_rc

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*:commands" rehash 1
