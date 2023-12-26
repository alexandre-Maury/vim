#!/usr/bin/env bash

#==============================================================================================================
#
# Auteur  : Alexandre Maury 
# Version 1.2
# License : GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Faire une modification du clonage dans /temp/
#==============================================================================================================

# Installation des dépendance
sudo apt install vim build-essential cmake vim-nox python3-dev

# Copy the vimrc file to ~/.vimrc
# cp -rf ./vimrc ~/.vimrc
git clone https://raw.githubusercontent.com/alexandre-Maury/vim/main/.vimrc ~/.vimrc

# Install Vundle with 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installation des plugins
vim +PluginInstall +qall

printf "%s \\n" "Installation de vim terminer"