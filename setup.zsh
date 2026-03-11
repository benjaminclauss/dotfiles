#!/bin/zsh
echo "Symlinking ~/.gitconfig..."
ln -nfs /Users/$USER/Developer/benjaminclauss/dotfiles/.gitconfig /Users/$USER/.gitconfig
echo "Symlinking ~/.ssh/config..."
mkdir -p /Users/$USER/.ssh
ln -nfs /Users/$USER/Developer/benjaminclauss/dotfiles/.ssh/config /Users/$USER/.ssh/config
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

echo "Applying macOS defaults..."
zsh /Users/$USER/Developer/benjaminclauss/dotfiles/.macos

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo "⚠️  No SSH key found."
  echo "    https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
else
  echo "ℹ️  Remember to run: ssh-add --apple-use-keychain ~/.ssh/id_ed25519"
  echo "    Add your public key to GitHub: https://github.com/settings/ssh/new"
  cat "$HOME/.ssh/id_ed25519.pub" | pbcopy
  echo "    Public key copied to clipboard."
  read -p "    Press enter once you've added the key to GitHub..."
  ssh -T git@github.com
fi

echo "Setup complete."
