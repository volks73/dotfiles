#!/usr/bin/env bash
#
# Installation script for dotfiles.
# Created by Christopher R. Field (volks73)
# Date Created: 2017-09-26
#
# Use this script to automate the installation of configuration files on
# a UNIX-like system with a Bash shell:
#
#     $ ./install.sh
#
# Since the `-f` flag is used for the `ln` command, this script will overwrite
# any previous files or links in the target locations with links to the
# configuration files in this repository.
ln -sf $(pwd)/vim/vimrc $HOME/.vimrc
ln -sf $(pwd)/vim/gvimrc $HOME/.gvimrc
ln -sf $(pwd)/bash/bashrc $HOME/.bashrc
mkdir -p $HOME/.hammerspoon
ln -sf $(pwd)/hammerspoon/init.lua $HOME/.hammerspoon/init.lua
ln -sf $(pwd)/hammerspoon/url.lua $HOME/.hammerspoon/url.lua
mkdir -p $HOME/.config/karabiner
ln -sf $(pwd)/karabiner/karabiner.json $HOME/.config/karabiner
ln -sf $(pwd)/emacs/spacemacs $HOME/.spacemacs

