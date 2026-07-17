alias reload="source ~/.bashrc"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Listing
if exists eza; then
	alias ls="eza --icons=always --group-directories-first"
	alias ll="eza -lAh --icons=always --git --group-directories-first"
	alias tree="eza --tree --icons=always"
else
	alias ls="ls --color=auto -F"
	alias ll="ls -lAh"
fi

# System
case "$DISTRO" in
	fedora)
		alias get="sudo dnf install"
		alias yeet="sudo dnf remove"
		alias search="dnf search"
		alias sync="sudo dnf distro-sync"
		alias update="sudo dnf upgrade --refresh"
		alias clean="sudo dnf autoremove && sudo dnf clean all"
		;;
	arch)
		alias update="sudo pacman -Syu"
		;;
	*)
		echo "configure aliases for $DISTRO"
		;;
esac

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gd="git diff"
alias gl="git log --oneline --graph --all"

# Tmux
alias tm="tmux"
alias tma="tmux attach -t"
alias tml="tmux ls"
alias tmk="tmux kill-session -t"

# Neovim
alias vi="nvim"

# FLatpaks (Fedora)
if [[ "$DISTRO" == "fedora" ]]; then
	alias vlc="flatpak run org.videolan.VLC"
fi
