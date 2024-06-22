HISTSIZE=1000
HISTFILE="${XDG_CACHE_HOME:-${HOME/.cache}}/zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

ZINIT_HOME="${XDG_DATA_HOME:-${HOME/.local/share}}/zinit/zinit.git"

if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p $(dirname $ZINIT_HOME)
  git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
fi

source "$ZINIT_HOME/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME:-${HOME/.config}}/oh-my-posh.toml)"

bindkey '^@' autosuggest-accept
bindkey '^k' history-search-forward
bindkey '^j' history-search-backward

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*:commands" rehash 1

[[ -f $HOME/.zshal ]] && source $HOME/.zshal
