# dotfiles

Personal macOS development environment configuration.

This repository manages my shell, editor, terminal, and window manager
setup using symlinks for portability across machines.

------------------------------------------------------------------------

## ✨ Stack

-   zsh
-   neovim
-   tmux (TPM-managed plugins)
-   ghostty
-   yabai
-   skhd
-   starship

------------------------------------------------------------------------

## 🚀 Quick setup (new machine)

### 1. Clone

``` bash
git clone git@github.com:kienanana/dotfiles.git ~/.dotfiles
```

### 2. Run bootstrap

``` bash
~/.dotfiles/bootstrap.sh
```

This will:

-   create required directories\
-   back up existing configs if present\
-   symlink dotfiles into place

------------------------------------------------------------------------

## 🔌 tmux setup on new devices (IMPORTANT)

Tmux plugins are **not stored in this repo**. They are managed by TPM.

### First-time setup on a fresh machine

1.  Start tmux:

``` bash
tmux
```

2.  Install TPM plugins:

```{=html}
<!-- -->
```
    prefix + I

(Default prefix is `Ctrl-b` unless changed.)

TPM will automatically clone and install:

-   catppuccin\
-   tmux-sensible\
-   tmux-minimal-theme\
-   etc.

After this step, tmux will match the original environment.

------------------------------------------------------------------------

## 🧠 Structure

    ~/.dotfiles
    ├── .config/
    │   ├── nvim/
    │   ├── ghostty/
    │   ├── yabai/
    │   ├── skhd/
    │   └── starship.toml
    ├── .tmux/
    ├── .tmux.conf
    ├── .zshrc
    └── bootstrap.sh

------------------------------------------------------------------------

## 🔐 Local overrides

Machine-specific or secret configuration should go into files like:

-   `~/.zshrc.local` (recommended)

These are ignored by git.

Example in `.zshrc`:

``` bash
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
```

------------------------------------------------------------------------

## 🛠 Maintenance

Update dotfiles:

``` bash
cd ~/.dotfiles
git add -A
git commit -m "update"
git push
```

------------------------------------------------------------------------

## 📌 Notes

-   macOS-first setup\
-   tested with Homebrew toolchain\
-   tmux plugins managed via TPM
