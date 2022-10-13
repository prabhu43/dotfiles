#!/bin/bash

set -e

DIRS_AND_FILES=(bashrc bash_profile profile zshrc gitconfig gemrc tool-versions oh-my-zsh/custom/aliases.zsh oh-my-zsh/custom/tw.zsh)
BACKUP_DIR="."


brew_packages() {
    echo "Backup brew..."
    brew tap Homebrew/bundle
    brew bundle dump --file=./Brewfile --force
}

dotfiles() {
  echo "Backup dotfile..."
  for dir_or_file in ${DIRS_AND_FILES[@]}; do
    full_path=~/.$dir_or_file
    if [[ -f $full_path ]]; then
      cp $full_path $BACKUP_DIR/$dir_or_file
    elif [[ -d $full_path ]]; then
      mkdir -p $full_path
      cp -R $full_path/ $BACKUP_DIR/$dir_or_file
    fi
  done

  echo "Copied existing files to $BACKUP_DIR"
  echo
}

iterm_preferences() {
  echo "Backup Iterm2 preferences..."
  defaults read com.googlecode.iterm2.plist > $BACKUP_DIR/iterm/com.googlecode.iterm2.plist
}

spectacle_shortcuts() {
  echo "Backup spectacle shorcuts..."
  cp ~/Library/Application\ Support/Spectacle/Shortcuts.json $BACKUP_DIR/spectacle/Shortcuts.json
}

vscode_plugins() {
    echo "Backup vscode plugin..."
    code --list-extensions >> vscode_plugins
}

brew_packages
dotfiles
iterm_preferences
spectacle_shortcuts
vscode_plugins

echo
echo "Backup done"
