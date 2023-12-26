#!/usr/bin/env bash

#==============================================================================================================
#
# Auteur  : Alexandre Maury 
# Version 1.2
# License : GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Faire une modification du clonage dans /temp/
#==============================================================================================================

# Copy the vimrc file to ~/.vimrc
cp -rf ./vimrc ~/.vimrc

# Installation des dépendance
sudo apt install build-essential cmake vim-nox python3-dev

# Install Vundle with 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installation des plugins
vim +PluginInstall +qall
