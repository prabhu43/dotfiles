#!/bin/bash

install_brew() {
  type brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

brew_packages() {
  brew install ansible
  brew install direnv
  brew install nmap
  brew install asdf
  brew install httpie
  brew install zplug
  brew install fzf
  /usr/local/opt/fzf/install --key-bindings --completion --no-update-rc

  # Homebrew-Cask
  brew tap caskroom/cask
  brew cask install firefox-beta
  brew cask install iterm2
  brew cask install visual-studio-code
  brew cask install google-chrome
  brew cask install ngrok
  brew cask install docker
  brew cask install flux
  brew cask install keeweb
  brew cask install openoffice
  brew cask install sublime-text
  brew cask install vagrant
  brew cask install vagrant-manager
  brew cask install rowanj-gitx
  brew cask install vlc
}