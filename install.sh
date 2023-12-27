#!/usr/bin/env bash

#==============================================================================================================
#
# Auteur  : Alexandre Maury 
# Version 1.2
# License : GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Faire une modification du clonage dans /temp/
#==============================================================================================================

deps=("fonts-powerline" "vim-nox")

# Check les paquets installé et procéde à l'installation de ce manquants
for dep in "${deps[@]}"; do
    if sudo apt list --installed 2>/dev/null | grep -q "^$dep/"; then
        printf "%s %s \\n" "==> $dep :" "Déjà installé"
    else
        printf "%s %s \\n" "[*] Installation :" "==> $dep"
        sudo apt install -y "$dep" || {
            printf "%s %s \\n" "[Erreur] lors de l'installation :" "==> $dep"
            exit 1
        }
        printf "%s %s \\n" "[Succès] installation" "==> $dep"
    fi
done

# Install Vundle with 
printf "%s %s \\n" "[Succès] Copie du Vundle" "==> $HOME/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
# Installation des fonts et du fichier vimrc
git clone https://github.com/alexandre-Maury/vim.git /tmp/vim

printf "%s %s \\n" "[Succès] Copie du fichier vimrc" "==> $HOME/.vimrc"
cp -rf /tmp/vim/vimrc ~/.vimrc

printf "%s %s \\n" "[Succès] Copie du dossier des fonts" "==> $HOME/.fonts"
cp -rf /tmp/vim/fonts ~/.fonts

# Mise ajours des fonts
fc-cache -fv

# Installation des plugins
printf "%s %s \\n" "[Succès] Installation des plugins" "==> $HOME/.vim/bundle"
vim -T $TERM +PluginInstall +qall < /dev/null

cd ~/.vim/bundle/YouCompleteMe/
sudo pip install cmake 
python3 install.py 

# Préparation pour le compte root
printf "%s \\n" "[Succès] Copie des fichier vers root" 
sudo cp -rf ~/.vim /root/.vim
sudo cp -rf ~/.vimrc /root/.vimrc 
sudo cp -rf ~/.fonts /root/.fonts


printf "%s \\n" "Installation de vim terminer"