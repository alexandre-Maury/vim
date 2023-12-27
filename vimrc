" File: .vimrc
"
" VIM FTW
"
set nocompatible
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' "Gestionnaire de plugins Vim

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'           "Thème basé sur le schéma de couleurs Solarized.
Plugin 'tomasr/molokai'                             "Autres Thème de couleurs.
Plugin 'vim-airline/vim-airline'                    "Barre de statut légère et personnalisable.
Plugin 'vim-airline/vim-airline-themes'             "Thèmes supplémentaires pour vim-airline.
Plugin 'ryanoasis/vim-devicons'                     "Icônes de fichier/coloration.
Plugin 'sheerun/vim-polyglot'                       "Syntaxe améliorée pour de nombreux langages.

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'                        "Ajoute une barre latérale pour explorer et naviguer.
Plugin 'jistr/vim-nerdtree-tabs'                    "Intègre NERDTree avec les onglets Vim pour une meilleure gestion des fichiers.
Plugin 'vim-syntastic/syntastic'                    "Un plugin de vérification de la syntaxe qui détecte les erreurs de code.
Plugin 'xolox/vim-misc'                             "Un ensemble de fonctionnalités diverses pour Vim.
Plugin 'xolox/vim-easytags'                         "Génère automatiquement des fichiers de balises pour faciliter la navigation dans le code.
Plugin 'majutsushi/tagbar'                          "Fournit une barre latérale pour afficher la structure des tags dans le fichier.
Plugin 'ctrlpvim/ctrlp.vim'                         "Un gestionnaire de fichiers qui permet de rechercher et d'ouvrir rapidement des fichiers.
Plugin 'vim-scripts/a.vim'                          "Ajoute des commandes pour naviguer entre les fichiers source et les fichiers d'en-tête.
Plugin 'Yggdroot/indentLine'                        "Affiche des lignes verticales pour indiquer l'indentation du code.

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'                     "Affiche les modifications Git dans la marge de gauche.
Plugin 'tpope/vim-fugitive'                         "Intégration Git pour Vim.

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'                       "Auto-complétion des paires de délimiteurs tels que parenthèses, crochets, guillemets, etc.
Plugin 'Valloric/YouCompleteMe'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'                           "Permet de consulter les pages de manuel directement depuis Vim.
Plugin 'christoomey/vim-tmux-navigator'             "Permet de naviguer entre Vim et tmux sans quitter le mode normal.

" ----- Syntax programmation plugins ------------------------------------------------
Plugin 'vim-scripts/bash-support.vim'               "Suite complète d'outils pour le développement en Bash
Plugin 'python-mode/python-mode'                    "Ensemble de fonctionnalités pour améliorer le développement en Python

" ---- Extras/Advanced plugins ----------------------------------------
Plugin 'ntpeters/vim-better-whitespace'             "Met en surbrillance et supprime automatiquement les espaces blancs en fin de ligne.


call vundle#end()

"Active le support des fichiers de type, des plugins et de l'indentation.
filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

hi clear SignColumn

" ----- Configurations pour Vim-Airline -----
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ----- Configuration pour NERDTree et NERDTree Tabs -----
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let NERDTreeShowHidden=1

" ----- Configuration pour Syntastic -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- Configuration pour Vim-Easytags - xolox -----
set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- Configuration pour Tagbar -----
nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- Configuration pour Vim-GitGutter -----
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Configuration pour DelimitMate -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- Configuration pour vim-superman -----
noremap K :SuperMan <cword><CR>

" ---- Configuration pour CtrlP ---
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Coloration des fichiers dans NERDTree -----
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
