export EDITOR=nvim
export TERMINAL=kitty
export QT_QPA_PLATFORMTHEME="qt6ct"
export WINEPREFIX="$HOME/wine"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GIT_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/git/config"
[[ ! -f "$GIT_CONFIG" ]] || GIT_CONFIG="$HOME/.gitconfig"
export WALLPAPER_DIR="$HOME/backgrounds"

export CARGO_HOME="$HOME/cargo"
export RUSTUP_HOME="$HOME/rustup"
export PATH="$CARGO_HOME/bin:$PATH"
