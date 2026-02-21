#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
mkdir -p "$HOME/.config"

link () {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  # If destination exists and isn't already the correct symlink, back it up.
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
      echo "OK (already linked): $dst"
      return
    fi
    local backup="${dst}.bak.$(date +%Y%m%d_%H%M%S)"
    mv "$dst" "$backup"
    echo "Backed up: $dst -> $backup"
  fi

  ln -s "$src" "$dst"
  echo "Linked: $dst -> $src"
}

# top-level dotfiles
link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES_DIR/.tmux" "$HOME/.tmux"

# ~/.config
link "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link "$DOTFILES_DIR/.config/ghostty" "$HOME/.config/ghostty"
link "$DOTFILES_DIR/.config/yabai" "$HOME/.config/yabai"
link "$DOTFILES_DIR/.config/skhd" "$HOME/.config/skhd"
link "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

echo "Done."
