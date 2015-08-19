cd ~/

# Bash config
if [ ! -f ~/.bashrc ]; then
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
fi

# Zshell config
if [ ! -d ~/.oh-my-zsh ]; then
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

if [ -f ~/.zshrc ]; then
    mv .zshrc .zshrc.backup
fi
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Install spacemacs
if [ ! -d ~/.emacs.d ]; then
    git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

# spacemacs config
if [ -f ~/.spacemacs ]; then
    mv .spacemacs .spacemacs.backup
fi
ln -s ~/.dotfiles/.spacemacs ~/.spacemacs
