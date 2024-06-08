#!/bin/zsh
echo "Symlinking ~/.zprofile..."
ln -nfs /Users/$USER/Developer/dotfiles/.zprofile /Users/$USER/.zprofile


echo "Symlinking ~/.Brewfile."
ln -nfs /Users/$USER/Developer/dotfiles/Brewfile /Users/$USER/.Brewfile
echo "Setup complete."