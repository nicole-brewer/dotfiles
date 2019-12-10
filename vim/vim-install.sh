#!/usr/bin/env bash

# THINGS THAT NEED TO BE ADDED TO TOP LEVEL
VIM=$(dirname "$0")
echo $VIM

## DEBIAN
# curl required for vundle
# sudo apt-get install curl
## RED HAT
# curl required for vundle
# sudo yum install curl

# set up vundle
git clone https://github.com/VundleVim/Vundle.vim.git $VIM/dot/vim/bundle/Vundle.vim

# install plugins
vim +PluginInstall +qall
