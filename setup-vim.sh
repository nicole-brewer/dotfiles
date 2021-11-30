#!/usr/bin/env bash

# set up vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# clone  solarized colors into Vundle bundle
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git 

# install plugins
vim +PluginInstall +qall
