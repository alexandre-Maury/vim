#!/usr/bin/env bash

#==============================================================================================================
#
# Auteur  : Alexandre Maury 
# Version 1.2
# License : GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Faire une modification du clonage dans /temp/
#==============================================================================================================

sudo apt install fonts-powerline
 
# Copy the vimrc file to ~/.vimrc
curl -o ~/.vimrc https://raw.githubusercontent.com/alexandre-Maury/vim/main/.vimrc

# Install Vundle with 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installation des plugins
vim +PluginInstall +qall

#sudo cp -rf ~/.vim /root/.vim
#sudo cp -rf ~/.vimrc /root/.vimrc 
#sudo vim +PluginInstall +qall

fc-cache -fv

printf "%s \\n" "Installation de vim terminer"
