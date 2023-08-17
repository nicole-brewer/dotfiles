# dotfiles

This repo contains my personal configuration files that I used to set up my MacBook Air (M1, 2020). This repository will help you (likely my future self) install all the applications and packages I use, install and setup miniconda, set up vim with plugins and the solarized colorscheme, and more. 

## Setting up a new MacOS

MacOS comes with git already installed, you can run 
```zsh
git clone https://github.com/nicole-brewer/dotfiles
```
in any directory you want the repository to live long-term. You can set up the entire project with the command

```zsh
./setup-macos.sh
```

This command will take a while to run but often has print statements to let you know what actions the script is taking. There is some interactivity at the end, as well as some information about some next steps to take from within application interfaces so that some features appear as intended. That's it! Almost as easy as using TimeMachine as one should (and I would, if I could).

## Features worth borrowing

If you are scouring dotfile projects to see what you should borrow, I recommend my `setup-dotfiles.sh` and `teardown-dotfiles.sh` files. They can be used independently of the other parts of this project to set up a whole bunch of symlinks, but also to undo those actions without messing up any of the existing files you already had sitting in your $HOME directory. 

### setup-dotfiles.sh 
This repository works by using symbolic links to make the dotfiles in this repository available in right location. Before dotfiles are linked, they are labeled with a `.dot` extension. For example, in the `zsh/` directory we have the following files.
```
├── zsh
│   ├── zshrc.dot
│   └── zprofile.dot
```
The `setup-dotfiles.sh` script takes all the `.dot` files in any directory and creates a symbolic link so they show up in the user's home directory as such. If any these files already exist at the time the script is run, they *will not* be overwritten. Instead, they will be appended with the `.local` extension to prevent any loss. Such a file would show up in the user's home directory as `.zshrc.local` or `.zprofile.local`. 
```
$ ls $HOME -a
.zshrc

$ ./setup-dotfiles.sh
$ ls
.zshrc.local .zshrc .zprofile
```

### Stop using this project

If you wish to stop using the dotfiles project, run `teardown-dotfiles.sh` to return all the dotfiles in the `$HOME` directory to their original state. That means that any files that were given a `.local` extension will be returned to their original state and all symlinks will no longer appear in the `$HOME` directory

```zsh
$ ls
.zshrc.local .zshrc .zprofile

$ ./teardown-dotfiles.sh
$ ls $HOME -a
.zshrc
```
