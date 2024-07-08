#!/bin/zsh
echo "Symlinking ~/.zprofile..."
ln -nfs /Users/$USER/Developer/dotfiles/.zprofile /Users/$USER/.zprofile

echo "Symlinking ~/.Brewfile."
ln -nfs /Users/$USER/Developer/dotfiles/Brewfile /Users/$USER/.Brewfile
echo "Setup complete."

# For the system Java wrappers to find this JDK, symlink it.
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk