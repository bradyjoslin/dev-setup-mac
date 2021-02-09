#!/usr/bin/env bash

set -e

xcode-select --install

# Install Homebrew if needed
# Check for Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  echo "Installing homebrew..."
  bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update
brew update

# Install web apps
brew install --cask firefox
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask dotnet-sdk

# Install dev apps
brew install --cask docker

# Install automation apps
brew install --cask alfred

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