# Theme
. ~/.dotfiles/shell/theme.zsh

# Emacs
. ~/.dotfiles/shell/emacs.zsh

# Lang
. ~/.dotfiles/shell/lang.zsh

# Server
. ~/.dotfiles/shell/server.zsh

# Others
. ~/.dotfiles/shell/others.zsh


#  Networking
## show the process that connects to the Internet
alias listen="lsof -P -i -n"

# Local Config
if [ -f ~/.dotfiles/shell/local.zsh ]; then
    . ~/.dotfiles/shell/local.zsh
fi
