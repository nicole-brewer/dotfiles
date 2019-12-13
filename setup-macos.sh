#!/usr/bin/env bash

# install homebrew package manager
cd /usr/local
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

# install miniconda3
curl -o https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh

# this prevents conda from initializing for every shell startup
conda config --set auto_auctivate_base false
source ~/.bashrc
conda install jupyter

