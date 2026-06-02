alias pip='python3 -m pip'
alias lg='lazygit'
eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init zsh)"

export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

neofetch --ascii ~/.dotfiles/.config/neofetch/ascii/music.txt 

# bun completions
[ -s "/Users/kienanyong/.bun/_bun" ] && source "/Users/kienanyong/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias leet='python3 ~/Documents/obsidian-scripts/leet.py'
