#!/usr/bin/env bash

# install homebrew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install coreutils

# install git and authenticate with a github token (in developer settings)
brew install git
brew install gh
gh auth login

# install miniconda
brew install --cask miniconda

# initialize conda with zsh, the default shell for macos
conda init zsh
conda init bash

# you don't have to restart as suggested if you source the file
source ~/.bashrc

# this prevents conda from initializing for every shell startup
conda config --set auto_auctivate_base false
conda config --prepend channels conda-forge

# create a base jupyter notebook environment to build from
conda create -n jupyter notebook jupyterlab voila
conda install -n jupyter -c fastai nbdev fastcore fastrelease

