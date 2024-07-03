#!/usr/bin/env bash

# install homebrew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages and applications
./brew-install.sh
./cask-install.sh

./setup-dotfiles.sh
./setup-vim.sh
./setup-miniconda.sh

# interactive credential setup
gh auth login

# get dircolors which uses colors to pretty print the `ls` command
mkdir -p solarized/dircolors-solarized/
curl -o solarized/dircolors-solarized/dircolors.ansi-universal https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-universal

echo "Several tasks also need to be done by hand. Let's get started!"

# instructions for enabling the solarized theme in iterm2
echo "We neeed to change our default color presets in iTerm2"
echo "Profiles > Default > Edit Profiles > Colors > Color Presets > Solarized Light"
echo "Opening iTerm2..."
open ~/Applications/iTerm.app

echo "We also want to download the Logitech Options and restore defaults"
echo "Opening Firefox to the logitech website..."
open -a Firefox https://support.logi.com/hc/en-us/articles/360025297893
echo "More > Backups > Restore Settings from Backup"



