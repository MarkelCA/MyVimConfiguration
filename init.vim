set nu
set rnu
set mouse=a
set clipboard=unnamed "Habilita el portapapeles del sistema 

"............ESTILOS.......................
set guifont=Consolas
"let g:deoplete#enable_at_startup = 1
"let g:jsx_ext_required = 0

syntax enable "Subrayado de sintaxis
set numberwidth=1
set showcmd "muestra los comando que estoy ejecutando
set ruler "mostrar numero de linea (por defecto en nvim)
set laststatus=2 "muestra la barra (no esta por defecto en vim)

set nobackup 
set noundofile 
set encoding=utf-8 
set showmatch "para mostrar el parentesis que cierra cuando me situo encima de uno

call plug#begin('~/.vim/plugged')
	" Themes
	Plug 'morhetz/gruvbox'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }

	" IDE
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/nerdtree'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'mattn/emmet-vim'

call plug#end()
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
"colorscheme gruvbox
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }onehalf
"let g:gruvbox_contrast_dark= "hard"
let NERDTreeQuitOnOpen=1
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>	
nmap <Leader>w : w<CR>
nmap <Leader>q : q<CR>
"emmet key
let g:user_emmet_leader_key=','
