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

# instructions for enabling the solarized theme in iterm2
echo "The next step must be done by hand...\n1. Open iTerm2\n2. Profiles > Default > Edit Profiles > Colors > Color Presets > Solarized Light"
