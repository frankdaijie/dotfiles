cd ~/

# Bash config
if [ ! -f ~/.bashrc ]; then
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
fi

# Zshell config
if [ ! -f ~/.zshrc ]; then
   curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
   mv .zshrc .zshrc.template
   ln -s ~/.dotfiles/.zshrc ~/.zshrc
fi

# spacemacs config
if [ ! -f ~/.spacemacs ]; then
   ln -s ~/.dotfiles/.spacemacs ~/.spacemacs
fi
