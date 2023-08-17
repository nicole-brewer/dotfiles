# install miniconda
brew install --cask miniconda

# install mamba, a faster implementation of conda
# https://www.anaconda.com/blog/a-faster-conda-for-a-growing-community
conda install -n base conda-libmamba-solver
conda install libarchive -n base -c conda-forge # this line may not be neccessary in the future but it solved this issue for me: https://github.com/mamba-org/mamba/issues/1826
conda config --set solver libmamba

# initialize conda with zsh, the default shell for macos
conda init "$(basename "${SHELL}")"

# you don't have to restart as suggested if you source the file
source ~/.bashrc

# this prevents conda from initializing for every shell startup
conda config --set auto_activate_base false
conda config --prepend channels conda-forge
