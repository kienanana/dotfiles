# dotfiles

this repository manages my shell, editor, terminal, and window manager setup using symlinks for portability across machines.

------------------------------------------------------------------------

## stack

-   zsh
-   neovim
-   tmux (TPM-managed plugins)
-   ghostty
-   yabai
-   skhd
-   starship
-   sketchybar

------------------------------------------------------------------------

## quick setup (new machine)

### 0. Prerequisites

-   [Homebrew](https://brew.sh) installed
-   [Ghostty](https://ghostty.org) installed manually (intentionally not in the Brewfile)

### 1. Clone

``` bash
git clone git@github.com:kienanana/dotfiles.git ~/.dotfiles
```

### 2. Run bootstrap

``` bash
~/.dotfiles/bootstrap.sh
```

This will:

-   install all tools from the `Brewfile` via `brew bundle` (idempotent)\
-   set zsh as the login shell if it isn't already (may prompt for your password)\
-   create required directories\
-   back up existing configs if present\
-   symlink dotfiles into place

Then **quit and reopen your terminal** so the new zsh login shell takes effect.

### Managing the Brewfile

The `Brewfile` is the single source of truth for installed tools. Regenerate it
from the current machine with:

``` bash
brew bundle dump --file=~/.dotfiles/Brewfile --force
```

------------------------------------------------------------------------

## tmux setup on new devices 

Tmux plugins are **not stored in this repo**. They are managed by TPM.

### First-time setup on a fresh machine

1.  Start tmux:

``` bash
tmux
```

2.  Install TPM plugins:
``` bash
prefix + I
```
(prefix: ctrl + a)

TPM will automatically clone and install:

-   catppuccin\
-   tmux-sensible\
-   tmux-minimal-theme\
-   etc.

After this step, tmux will match the original environment.

------------------------------------------------------------------------

## skhd reload
``` bash
launchctl kickstart -k gui/$(id -u)/com.koekeishiya.skhd
```