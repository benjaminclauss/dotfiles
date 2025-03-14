#!/bin/zsh
echo "Symlinking ~/.zprofile..."
ln -nfs /Users/$USER/Developer/benjaminclauss/dotfiles/.zprofile /Users/$USER/.zprofile
echo "Symlinking ~/.zshrc..."
ln -nfs /Users/$USER/Developer/benjaminclauss/dotfiles/.zshrc /Users/$USER/.zshrc

echo "Symlinking ~/.Brewfile."
ln -nfs /Users/$USER/Developer/benjaminclauss/dotfiles/Brewfile /Users/$USER/.Brewfile

# Install Ruby Gems.
bundle install

# For the system Java wrappers to find this JDK, symlink it.
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# Create screenshot directory.
mkdir -p /Users/$USER/Pictures/Screenshots
# https://www.macworld.com/article/673251/how-to-change-where-screenshots-are-saved-on-a-mac.html

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Disable "Rearrange automatically"
defaults write com.apple.dock "mru-spaces" -bool false && killall Dock

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

echo "Setup complete."
