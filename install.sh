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
 

# Installation des fonts et du fichier vimrc
# curl -o ~/.vimrc https://raw.githubusercontent.com/alexandre-Maury/vim/main/.vimrc
git clone https://github.com/alexandre-Maury/vim.git /tmp/vim

printf "%s %s \\n" "[Succès] Copie du fichier vimrc" "==> $HOME/.vimrc"
cp /tmp/vim/vimrc ~/.vimrc

printf "%s %s \\n" "[Succès] Copie du dossier des fonts" "==> $HOME/.fonts"
cp /tmp/vim/fonts ~/.fonts

# Install Vundle with 
printf "%s %s \\n" "[Succès] Copie du Vundle" "==> $HOME/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# Installation des plugins
printf "%s %s \\n" "[Succès] Installation des plugins" "==> $HOME/.vim/bundle"
vim +PluginInstall +qall

# Préparation pour le compte root
sudo cp -rf ~/.vim /root/.vim
sudo cp -rf ~/.vimrc /root/.vimrc 
sudo vim +PluginInstall +qall

# Mise ajours des fonts
fc-cache -fv

printf "%s \\n" "Installation de vim terminer"
