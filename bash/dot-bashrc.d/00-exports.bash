export DISTRO=$(. /etc/os-release; echo "$ID")
export EDITOR="nvim"
export VISUAL="nvim"

HISTCONTROL='ignoredups:erasedups'
HISTSIZE=5000
HISTFILESIZE=5000
