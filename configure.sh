#!/usr/bin/env bash

sudo softwareupdate -ia --verbose
xcode-select --install

set -e

# Configure Mac
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write com.apple.finder CreateDesktop false
killall Finder
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Remove Teams codesigning for virtual cameras
sudo codesign --remove-signature "/Applications/Microsoft Teams.app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper.app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (GPU).app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (Plugin).app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (Renderer).app"

# Install FireCode NF
curl -Ls -o FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode
mkdir -p "$HOME/Library/Fonts"
cp -a FiraCode/. "$HOME/Library/Fonts"
rm -r FiraCode
rm FiraCode.zip

# ZSH autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc"