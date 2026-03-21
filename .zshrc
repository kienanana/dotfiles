alias pip='python3 -m pip'
eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

neofetch --ascii ~/.dotfiles/.config/neofetch/ascii/music.txt