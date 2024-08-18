export XDG_CONFIG_HOME="$HOME/config"
export XDG_CACHE_HOME="$HOME/cache"
export XDG_DATA_HOME="$HOME/data"
export XDG_STATE_HOME="$HOME/state"
export EDITOR=nvim
export CARGO_HOME="$HOME/rust/cargo"
export RUSTUP_HOME="$HOME/rust/rustup"
export QT_QPA_PLATFORMTHEME="qt6ct"
export WINEPREFIX="$HOME/wine"
export CMAKE_GENERATOR="Ninja"
export ZDOTDIR="${XDG_CONFIG_HOME:-${HOME/.config}}/zsh"
export GIT_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/git/config"
[[ ! -f "$GIT_CONFIG" ]] || GIT_CONFIG="$HOME/.gitconfig"
