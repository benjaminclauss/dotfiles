#!/bin/zsh
echo "Symlinking ~/.zprofile..."
ln -nfs /Users/$USER/Developer/dotfiles/.zprofile /Users/$USER/.zprofile
echo "Setup complete."
