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