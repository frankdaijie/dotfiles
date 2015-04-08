cd ~/
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
mv .zshrc .zshrc.template
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.spacemacs ~/.spacemacs
