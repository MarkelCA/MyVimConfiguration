"ENV VARIABLE
	let $INIT = 'C:\Users\marke\AppData\Local\nvim\init.vim'
"EDITOR
	set nu
	set rnu
	set mouse=a "Habilita el ratón para desplazarse
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
	
"File and format
	set nobackup 
	set noundofile 
	set encoding=utf-8 
	set showmatch "para mostrar el parentesis que cierra cuando me situo encima de uno
 set tabstop=4
 set shiftwidth=4
 set expandtab

" PLUGINS VIM-PLUG
	call plug#begin('~/.vim/plugged')
		" Themes
		Plug 'morhetz/gruvbox'
		Plug 'sonph/onehalf', { 'rtp': 'vim' }
		Plug 'itchyny/lightline.vim' "Barra inferior tuneada

		" IDE
		Plug 'easymotion/vim-easymotion'
		Plug 'scrooloose/nerdtree'
		Plug 'christoomey/vim-tmux-navigator'
		"Plug 'zxqfl/tabnine-vim' " autocompletado (necesario YouCompleteMe)

		" Atajos
		Plug 'mattn/emmet-vim'
		Plug 'preservim/nerdcommenter'
	call plug#end()

"VUNDLE PLUGINS
	set nocompatible              " be iMproved, required
	filetype off                  " required
	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim

	call vundle#begin()
		"Enable Vundle
		Plugin 'VundleVim/Vundle.vim'
		
		"Rainbow brackets
		Plugin 'frazrepo/vim-rainbow'

	call vundle#end()            " required

	filetype plugin indent on    " required

"Styles
	syntax on
	"let g:rainbow_active = 1 "Enable rainbow brackets
	set t_Co=256
	set cursorline
	colorscheme onehalfdark
	"colorscheme gruvbox
	let g:airline_theme='onehalfdark'

"NERDTree
	let NERDTreeQuitOnOpen=1
" Atajos
	let mapleader=" "
	nmap <Leader>s <Plug>(easymotion-s2)
	nmap <Leader>nt :NERDTreeFind<CR>	
	nmap <Leader>w : w<CR>
	nmap <Leader>q : q<CR>
	let g:user_emmet_leader_key=',' "emmet key

filetype plugin on
