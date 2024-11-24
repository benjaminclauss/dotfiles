#!/bin/zsh
echo "Symlinking ~/.zprofile..."
ln -nfs /Users/$USER/Developer/dotfiles/.zprofile /Users/$USER/.zprofile

echo "Symlinking ~/.Brewfile."
ln -nfs /Users/$USER/Developer/dotfiles/Brewfile /Users/$USER/.Brewfile

# Install Ruby Gems.
bundle install

# For the system Java wrappers to find this JDK, symlink it.
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# Create screenshot directory.
mkdir -p /Users/$USER/Pictures/Screenshots
# https://www.macworld.com/article/673251/how-to-change-where-screenshots-are-saved-on-a-mac.html

echo "Setup complete."