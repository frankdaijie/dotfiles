cd ~/

# Bash config
if [ ! -f ~/.bashrc ]; then
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
fi

# Zshell config
if [ ! -d ~/.oh-my-zsh ]; then
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

if [ ! -f ~/.zshrc ]; then
    mv .zshrc .zshrc.backup
    ln -s ~/.dotfiles/.zshrc ~/.zshrc
fi

# Install spacemacs
if [ ! -d ~/.emacs.d ]; then
    git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
    mv .spacemacs .spacemacs.backup
fi

# spacemacs config
if [ ! -f ~/.spacemacs ]; then
    ln -s ~/.dotfiles/.spacemacs ~/.spacemacs
fi
