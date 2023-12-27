#!/usr/bin/env bash

#==============================================================================================================
#
# Auteur  : Alexandre Maury 
# Version 1.2
# License : GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Faire une modification du clonage dans /temp/
#==============================================================================================================

mkdir /home/$USER/.vim && mkdir /home/$USER/.vim/bundle

deps=("fonts-powerline" "vim-nox" "build-essential" "cmake" "python3-dev")

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
printf "%s %s \\n" "[Succès] Copie du Vundle" "==> /home/$USER/.vim/bundle/Vundle.vim"
# git clone https://github.com/VundleVim/Vundle.vim.git /tmp/vim/Vundle
# cp -rf /tmp/vim/Vundle /home/$USER/.vim/bundle/Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
# Installation des fonts et du fichier vimrc
git clone https://github.com/alexandre-Maury/vim.git /tmp/vim/repo

printf "%s %s \\n" "[Succès] Copie du fichier vimrc" "==> /home/$USER/.vimrc"
cp -rf /tmp/vim/repo/vimrc /home/$USER/.vimrc

printf "%s %s \\n" "[Succès] Copie du dossier des fonts" "==> /home/$USER/.fonts"
cp -rf /tmp/vim/repo/fonts /home/$USER/.fonts

# Mise ajours des fonts
fc-cache -fv /home/$USER/.fonts < /dev/null

# Installation des plugins
printf "%s %s \\n" "[Succès] Installation des plugins" "==> root/.vim/bundle"
vim -T $TERM +PluginInstall +qall < /dev/null

cd /home/$USER/.vim/bundle/YouCompleteMe/ && pip install --user --upgrade cmake && python3 install.py < /dev/null

echo 'export VISUAL=vim' >> ~/.zshrc
echo 'export VISUAL=vim' >> ~/.bashrc

sudo rm -rf /tmp/vim

printf "%s \\n" "Installation de vim terminer."
printf "%s \\n" "[*] Modifier un fichier avec les privilèges root" "==> sudoedit /root/fichier_root.sh"
