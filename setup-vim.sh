#!/usr/bin/env bash
# note: setup.sh must be run before setup-vim.sh

echo "Setting up Vundle plugin manager for vim..."
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "Cloning solarized colors into Vundle bundle..."
cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized

echo "Installing vim plugins..."
vim +PluginInstall +qall
