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
ln -sf $(pwd)/vimrc $HOME/.vimrc
ln -sf $(pwd)/gvimrc $HOME/.gvimrc
mkdir -p $HOME/.hammerspoon
ln -sf $(pwd)/hammerspoon/init.lua $HOME/.hammerspoon/init.lua
mkdir -p $HOME/.config/karabiner
ln -sf $(pwd)/karabiner/karabiner.json $HOME/.config/karabiner
ln -sf $(pwd)/spacemacs $HOME/.spacemacs

