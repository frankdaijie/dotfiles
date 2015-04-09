cd ~/

# Bash config
if [ ! -f ~/.bashrc ]; then
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
fi

# Zshell config
if [ ! -f ~/.zshrc ]; then
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    mv .zshrc .zshrc.backup
    ln -s ~/.dotfiles/.zshrc ~/.zshrc
fi

# spacemacs config
if [ ! -f ~/.spacemacs ]; then
    git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
    mv .spacemacs .spacemacs.backup
    ln -s ~/.dotfiles/.spacemacs ~/.spacemacs
fi
