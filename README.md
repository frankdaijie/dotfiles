# My personal configuration

## Installation

Download:
``` sh
git clone https://github.com/frankdj412/dotfiles.git .dotfiles
```

Install:
``` sh
cd ~/.dotfiles
sh ./installer.sh
```

## Shell
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is used for zshell
configuration.

### auto jump
The autojump feature is provided by [fasd](https://github.com/clvv/fasd) where `j` is mapped for `autojump` customs:

``` sh
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection
```

### magic-space

~SPC~ is bound to execute `magic-space` which performs history expansion in the line.

## Emacs setting
[spacemacs](https://github.com/syl20bnr/spacemacs) is used and my emacs
setting is my supplement to its setting:

- Chinese input method
- irony-mode for c/c++ auto-complete
- thrift

## Some other necessary programs or packages

- clang
- fasd
- tmux
