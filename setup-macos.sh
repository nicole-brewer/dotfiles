#!/usr/bin/env bash

# install homebrew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages and applications
./brew-install.sh
./cask-install.sh

./setup-dotfiles.sh
./setup-vim.sh
./setup-miniconda.sh

# get dircolors which uses colors to pretty print the `ls` command
mkdir -p solarized/dircolors-solarized/
curl -o solarized/dircolors-solarized/dircolors.ansi-universal https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-universal

echo "Several tasks also need to be done by hand. Let's get started!"
`
# interactive credential setup
gh auth login

# instructions for enabling the solarized theme in iterm2
echo "We neeed to change our default color presets in iTerm2"
echo "Profiles > Default > Edit Profiles > Colors > Color Presets > Solarized Light"
echo "Opening iTerm2..."
open ~/Applications/iTerm.app

echo "We also want to download the Logitech Options and restore defaults"
echo "Opening Firefox to the logitech website..."
open -a Firefox https://support.logi.com/hc/en-us/articles/360025297893
echo "More > Backups > Restore Settings from Backup"

# llm (https://llm.datasette.io/en/stable/index.html) is a command line tool
# we can use pretty much an llm with it. I found out about it because of this
# nice vidoe here: https://www.youtube.com/watch?v=QUXQNi6jQ30 
echo "llm is a command line tool. To set up your API key,"
read -p "enter your preferred llm (default is openai): " userInput
choice="${userInput:-openai}"
llm keys set $choice
# llm-cmd is an llm plugin that let's you use natural language to generate
# single line terminal commands that are ready to execute
# NOTE: I used the command llm install https://github.com/nkkko/llm-cmd/archive/b5ff9c2a970720d57ecd3622bd86d2d99591838b.zip
# to install the plugin because of an error described in https://github.com/simonw/llm-cmd/issues/11
# To uninstall that version, use llm uninstall
llm install llm-cmd
