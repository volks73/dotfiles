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
ln -s $HOME/.dotfiles/gvimrc $HOME/.gvimrc
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
mkdir -p $HOME/.hammerspoon
ln -s $HOME/.dotfiles/hammerspoon/init.lua $HOME/.hammerspoon/init.lua
mkdir -p $HOME/.config/karabiner
ln -s $HOME/.dotfiles/karabiner/karabiner.json $HOME/.config/karabiner
ln -s $HOME/.dotfiles/spacemacs $HOME/.spacemacs

