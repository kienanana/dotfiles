#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
mkdir -p "$HOME/.config"

# Install tools from the Brewfile (idempotent — skips what's already present).
if command -v brew >/dev/null 2>&1; then
  echo "Installing tools from Brewfile..."
  brew bundle --file="$DOTFILES_DIR/Brewfile"
else
  echo "WARNING: Homebrew not found — skipping tool install. Install from https://brew.sh first."
fi

# Make zsh the login shell if it isn't already.
ZSH_PATH="$(command -v zsh || true)"
if [ -n "$ZSH_PATH" ] && [ "$SHELL" != "$ZSH_PATH" ]; then
  echo "Switching login shell to $ZSH_PATH (may prompt for your password)..."
  grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
  chsh -s "$ZSH_PATH"
fi

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
link "$DOTFILES_DIR/.config/lazygit" "$HOME/.config/lazygit"
link "$DOTFILES_DIR/.config/sketchybar" "$HOME/.config/sketchybar"
link "$DOTFILES_DIR/.config/borders" "$HOME/.config/borders"
link "$DOTFILES_DIR/.config/fastfetch" "$HOME/.config/fastfetch"

# tmux plugin manager + plugins (the .tmux dir is symlinked above, so this
# populates the repo's plugin dir). Idempotent — skips clone if TPM exists.
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR/.git" ]; then
  echo "Installing tmux plugin manager..."
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
echo "Installing tmux plugins..."
TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/" "$TPM_DIR/bin/install_plugins"

echo "Done."
