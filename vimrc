" ------------------------------------------------------------
" File .vimrc
" ------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugged')			"Plugins will be downloaded under the specified directory.

Plugin 'VundleVim/Vundle.vim' 				"Gestionnaire de plugins Vim

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'           	"Thème basé sur le schéma de couleurs Solarized.
Plugin 'tomasr/molokai'                             	"Autres Thème de couleurs.
Plugin 'vim-airline/vim-airline'                    	"Barre de statut légère et personnalisable.
Plugin 'vim-airline/vim-airline-themes'             	"Thèmes supplémentaires pour vim-airline.
Plugin 'ryanoasis/vim-devicons'                     	"Icônes de fichier/coloration.
Plugin 'sheerun/vim-polyglot'                       	"Syntaxe améliorée pour de nombreux langages.

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'                        	"Ajoute une barre latérale pour explorer et naviguer.
Plugin 'jistr/vim-nerdtree-tabs'                    	"Intègre NERDTree avec les onglets Vim pour une meilleure gestion des fichiers.
Plugin 'vim-syntastic/syntastic'                    	"Un plugin de vérification de la syntaxe qui détecte les erreurs de code.
Plugin 'xolox/vim-misc'                             	"Un ensemble de fonctionnalités diverses pour Vim.
Plugin 'xolox/vim-easytags'                         	"Génère automatiquement des fichiers de balises pour faciliter la navigation dans le code.
Plugin 'majutsushi/tagbar'                          	"Fournit une barre latérale pour afficher la structure des tags dans le fichier.
Plugin 'ctrlpvim/ctrlp.vim'                         	"Un gestionnaire de fichiers qui permet de rechercher et d'ouvrir rapidement des fichiers.
Plugin 'vim-scripts/a.vim'                          	"Ajoute des commandes pour naviguer entre les fichiers source et les fichiers d'en-tête.
Plugin 'Yggdroot/indentLine'                        	"Affiche des lignes verticales pour indiquer l'indentation du code.

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'                     	"Affiche les modifications Git dans la marge de gauche.
Plugin 'tpope/vim-fugitive'                         	"Intégration Git pour Vim.

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'                       	"Auto-complétion des paires de délimiteurs tels que parenthèses, crochets, guillemets, etc.
Plugin 'Valloric/YouCompleteMe'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'                           	"Permet de consulter les pages de manuel directement depuis Vim.
Plugin 'christoomey/vim-tmux-navigator'             	"Permet de naviguer entre Vim et tmux sans quitter le mode normal.

" ----- Syntax programmation plugins ------------------------------------------------
Plugin 'vim-scripts/bash-support.vim'               	"Suite complète d'outils pour le développement en Bash
Plugin 'python-mode/python-mode'                    	"Ensemble de fonctionnalités pour améliorer le développement en Python

" ---- Extras/Advanced plugins ----------------------------------------
Plugin 'ntpeters/vim-better-whitespace'             	"Met en surbrillance et supprime automatiquement les espaces blancs en fin de ligne.


call vundle#end()


filetype plugin indent on				"Active le support des fichiers de type, des plugins et de l'indentation.


" ------------------------------------------------------------
" Vim-Airline configuration -> ok
" ------------------------------------------------------------

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline_detect_spell=1


let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

" ------------------------------------------------------------
" NERDTree configuration -> ok
" ------------------------------------------------------------

let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31

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

" ------------------------------------------------------------
" Syntastic configuration -> ok
" ------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

" ------------------------------------------------------------
" Vim-Easytags - xolox configuration -> ok
" ------------------------------------------------------------

let g:easytags_dynamic_files = 1
"let g:easytags_languages = ['*']
let g:easytags_ctags_options = '--exclude=node_modules --exclude=build'
let g:easytags_ignore = ['*.log', '*.tmp']
aut BufWritePost *.js,*.py,*.java,*.c,*.cpp call EasyTagsAsyncUpdate()
nmap <C-]> :EasyTagsFindDefinition<CR>
nnoremap <silent> <Leader>t :tag<Space>
command! -nargs=0 EasyTagsUpdate :call easytags#update()
command! -nargs=0 EasyTagsAsyncUpdate :call easytags#update(1)

" ------------------------------------------------------------
" tagbar configuration -> ok
" ------------------------------------------------------------

let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'

" ------------------------------------------------------------
" Vim-GitGutter configuration -> ok
" ------------------------------------------------------------

let g:gitgutter_enabled = 1
" Afficher le signe '+' pour les lignes ajoutées, et '-' pour les lignes supprimées
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

" Utiliser la colonne de signes pour afficher les changements dans la gutter
let g:gitgutter_use_sign_column = 1

" Ignorer les espaces lors de la comparaison des lignes
let g:gitgutter_ignore_whitespace = 1

" Afficher le nombre de lignes modifiées dans la statusline
set statusline+=%{GitGutter('Count')}

" Configurer la couleur des signes pour les lignes ajoutées, modifiées et supprimées
highlight GitGutterAdd    ctermbg=NONE ctermfg=Green guibg=NONE guifg=Green
highlight GitGutterChange ctermbg=NONE ctermfg=Blue  guibg=NONE guifg=Blue
highlight GitGutterDelete ctermbg=NONE ctermfg=Red   guibg=NONE guifg=Red


" ------------------------------------------------------------
" DelimitMate configuration -> ok
" ------------------------------------------------------------

let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ------------------------------------------------------------
" vim-superman configuration -> ok
" ------------------------------------------------------------

noremap K :SuperMan <cword><CR>

" ------------------------------------------------------------
" CtrlP configuration 
" ------------------------------------------------------------

let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_depth = 40
nnoremap <leader>p :CtrlP %:h<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>
nnoremap <leader>f :CtrlP<cr>

" ------------------------------------------------------------
" Vim configuration
" ------------------------------------------------------------

set ai 
"set nu                  							" Activer les numéros de ligne
syntax on               							" Activer la coloration syntaxique
set incsearch           							" Activer la recherche incrémentielle
set hlsearch            							" Activer la mise en surbrillance de la recherche
set splitbelow          							" Toujours diviser en dessous
set mouse=a             							" Activer le glisser de la souris sur les divisions de fenêtre
set tabstop=4  	 			     					" Nombre de colonnes d'espacement qu'une tabulation vaut
set softtabstop=0								" Désactive la fonction de tabulation souple
set smarttab									" Active la fonction de tabulation intelligente
set shiftwidth=4        							" Nombre de colonnes d'espacement qu'un "niveau d'indentation" vaut
set expandtab           							" Utiliser des espaces lors de l'utilisation de la touche Tab
set backspace=indent,eol,start							" Configure le comportement de la touche de retour arrière
set encoding=utf8								" Définit l'encodage du texte en UTF-8.
set showcmd									" Affiche la commande en bas de l'écran
set ruler									" Affiche une ligne d'état en bas de la fenêtre qui indique le numéro de ligne actuel ...
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11	" Configure la police pour l'interface graphique Vim

"highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

if !has('nvim')									" Condition pour exécuter la ligne suivante uniquement si Vim (et non Neovim) est utilisé
    set termwinsize=12x0    							" Définir la taille du terminal
endif

set background=dark     							" Définir le fond
"colorscheme scheakur    							" Définir le jeu de couleurs

hi clear SignColumn								" Efface les paramètres de mise en forme pour la colonne de signes.



highlight VertSplit ctermbg=none ctermfg=98 cterm=none


" ------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------

" General
nmap        <C-B>     :buffers<CR>
nmap        <C-J>     :term<CR>

" NERDTree
nmap        <F2>      :NERDTreeToggle<CR>

" tagbar
nmap        <F8>      :TagbarToggle<CR>

" ctrlds
nmap        <C-F>f    <Plug>CtrlSFPrompt
xmap        <C-F>f    <Plug>CtrlSFVwordPath
xmap        <C-F>F    <Plug>CtrlSFVwordExec
nmap        <C-F>n    <Plug>CtrlSFCwordPath
nmap        <C-F>p    <Plug>CtrlSFPwordPath
nnoremap    <C-F>o    :CtrlSFOpen<CR>
nnoremap    <C-F>t    :CtrlSFToggle<CR>
inoremap    <C-F>t    <Esc>:CtrlSFToggle<CR>
