#!/usr/bin/env bash

sudo softwareupdate -ia --verbose
xcode-select --install

set -e

# Install Homebrew if needed
# Check for Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  echo "Installing homebrew..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install web apps
brew install --cask firefox
brew install --cask google-chrome
brew install --cask signal

# Install dev apps
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask iterm2
brew install --cask dotnet-sdk
brew install --cask postman
brew install --cask github
brew install --cask graphiql
brew install --cask sketch
brew install --cask microsoft-azure-storage-explorer
brew install --cask visual-studio

# Install communication apps
brew install --cask microsoft-teams
brew install --cask discord
brew install --cask slack
brew install --cask zoom
brew install --cask telegram
brew install --cask cloudflare-warp
brew install --cask krisp

# Install productivity apps
brew install --cask alfred
brew install --cask google-backup-and-sync
brew install --cask dropbox
brew install --cask 1password
brew install --cask microsoft-office
brew install --cask evernote
brew install --cask kindle
brew install --cask parallels

# Install security apps
brew install --cask lulu
brew install --cask knockknock
brew install --cask blockblock
brew install --cask reikey

# Install dev tools
brew install rust
brew install jq
brew install azure-cli
brew install shellcheck
brew install gh
brew install fastlane
brew install git
brew install httpie
brew install mosh
brew install zola
brew install curl
brew install ripgrep
brew install starship

brew tap bradyjoslin/sharewifi
brew install sharewifi

# Remove outdated versions
brew cleanup

# Install node using nvm
# Install if we don't have it
if test ! "$(which nvm)"; then
  echo "Installing nvm..."
  touch ~/.zshrc
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm install node
fi

# Install Global npm packages
npm update -g
npm i appcenter-cli -g

# Install wrangler
cargo install wrangler

# Install FireCode NF
curl -Ls -o FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode
mkdir -p "$HOME/Library/Fonts"
cp -a FiraCode/. "$HOME/Library/Fonts"
rm -r FiraCode
rm FiraCode.zip

# Remove Teams codesigning for virtual cameras
sudo codesign --remove-signature "/Applications/Microsoft Teams.app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper.app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (GPU).app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (Plugin).app"
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (Renderer).app"

# Configure Mac
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false