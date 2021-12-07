#!/usr/bin/env bash

# install homebrew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install coreutils

# install git and authenticate with a github token (in developer settings)
brew install git
brew install gh

# application colors
git clone https://github.com/altercation/solarized.git

# install miniconda
brew install --cask miniconda

# install mamba, a faster implementation of conda
conda install -y  mamba -n base -c conda-forge

# initialize conda with zsh, the default shell for macos
conda init "$(basename "${SHELL}")"

# you don't have to restart as suggested if you source the file
source ~/.bashrc

# this prevents conda from initializing for every shell startup
conda config --set auto_auctivate_base false
conda config --prepend channels conda-forge

# TODO: shove this into an environment file
# create a base jupyter notebook environment to build from
conda create -y -n jupyter notebook jupyterlab voila
conda install -y -n jupyter -c fastai nbdev fastcore fastrelease

# interactive credential setup
gh auth login
