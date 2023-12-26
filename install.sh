#!/usr/bin/env bash

#==============================================================================================================
#
# Auteur  : Alexandre Maury 
# Version 1.2
# License : GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Faire une modification du clonage dans /temp/
#==============================================================================================================

sudo apt install fonts-powerline vim-nox -y
 
# Copy the vimrc file to ~/.vimrc
curl -o ~/.vimrc https://raw.githubusercontent.com/alexandre-Maury/vim/main/.vimrc

# Install Vundle with 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installation des fonts
git clone https://github.com/alexandre-Maury/vim/tree/fa21c9c0179392c98a4887ab36a5806cdda49c03/fonts ~/.fonts

# Installation des plugins
vim +PluginInstall +qall

# Préparation pour le compte root
sudo cp -rf ~/.vim /root/.vim
sudo cp -rf ~/.vimrc /root/.vimrc 
sudo vim +PluginInstall +qall

# Mise ajours des fonts
fc-cache -fv

printf "%s \\n" "Installation de vim terminer"
