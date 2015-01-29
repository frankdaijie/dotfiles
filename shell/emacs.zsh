alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
export PATH="/usr/local/bin:$PATH"

# Terminal Emacs
alias e='emacsclient -t'

# GUI Emacs
alias ec='emacsclient -c -q &'

# Force myself using Emacs
# alias vim='emacsclient -t'
# alias vi='emacsclient -t'

# Turn on/off emacs daemon
alias ecc="emacsclient -e '(kill-emacs)'"
alias ecd="emacs --daemon"

# Emacs Daemon
export ALTERNATE_EDITOR=""
export EDITOR=emacsclient

export TERM=xterm-256color
export PATH="~/bin:$PATH"
