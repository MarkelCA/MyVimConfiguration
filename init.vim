"ENV VARIABLE 
    let $INIT = '~/.config/nvim/init.vim'

"EDITOR
    set nu
    set rnu
    set mouse=a "Habilita el ratón para desplazarse
    set clipboard=unnamed "Habilita el portapapeles del sistema 
    nnoremap # *N
    nnoremap * *N
    let g:airline_powerline_fonts = 1
    let g:airline_theme='deus'

"File and format
    set nobackup 
    set noundofile 
    set encoding=utf-8 
    set showmatch "para mostrar el parentess que cierra cuando me situo encima de uno
    set tabstop=4
    set shiftwidth=4
    set expandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab "sets YAML indent to 2 spaces

" GIT BLAMER
    "\   'coc-ccls', "C compiler
    let g:coc_global_extensions = [
    \   'coc-json',
    \   'coc-git',
    \   'coc-vimlsp', 
    \   'coc-clangd', 
    \   'coc-css', 
    \   'coc-phpls', 
    \   'coc-tsserver',
    \   'coc-solargraph',
    \]

    let g:blamer_enabled = 1
    let g:blamer_delay = 0
    let g:blamer_template = '<author>: <committer-time> - <summary>'
    let g:blamer_relative_time = 1
    let g:blamer_show_in_visual_modes = 0

"COC GIT
    nmap [g <Plug>(coc-git-prevchunk)
    nmap ]g <Plug>(coc-git-nextchunk)
    " navigate conflicts of current buffer
    nmap [c <Plug>(coc-git-prevconflict)
    nmap ]c <Plug>(coc-git-nextconflict)
    " show chunk diff at current position
    nmap gs <Plug>(coc-git-chunkinfo)
    " show commit contains current position
    nmap gc <Plug>(coc-git-commit)
    " create text object for git chunks
    omap ig <Plug>(coc-git-chunk-inner)
    xmap ig <Plug>(coc-git-chunk-inner)
    omap ag <Plug>(coc-git-chunk-outer)
    xmap ag <Plug>(coc-git-chunk-outer)


" DVORAK Key remap
    " Documentation
    nnoremap <silent> D :call <SID>show_documentation()<CR>

    " Tab movement
    nnoremap <S-Right> :tabnext<CR>
    nnoremap <S-Left> :tabprevious<CR>
    nnoremap <S-n> :tabnext<CR>
    nnoremap <S-s> :tabprevious<CR>

    " Main Movement
    noremap  H 10j
    noremap  T 10k
    noremap  U 10j
    noremap  E 10k
    " Go down
    noremap h j
    noremap u j
    " Go up
    noremap t k
    noremap e k
    " Go left
    noremap n h
    noremap ; n

    " Insert after 
    noremap r a
    " Replace
    noremap l r
    " Prev word
    noremap m b
    " Go right
    noremap s l
    noremap a l
    " Undo
    noremap , u
    " Delete line
    noremap k e
    " New line
    noremap j o
    " New line
    noremap j o

let NERDTreeMapOpenInTab='-'
let NERDTreeMapUpdir=''
let NERDTreeMapOpenExpl=''
let NERDTreeMapOpenInTabSilent=''
"NERDTree
    let NERDTreeQuitOnOpen=1

" Atajos
    "" Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
    let mapleader=" "
    let g:user_emmet_leader_key='?' "emmet key
    " Open new tab
    nmap <Leader>rc :tabnew<CR>
	nmap <Leader>s <Plug>(easymotion-s2)
	nmap <Leader>nt :NERDTreeFind<CR>	
	nmap <Leader>w : w<CR>
    nmap <Leader>q : q<CR>

    " Open File Search
	nmap <Leader>f :Files<CR>
    " Align top
	nmap <Leader>t zt
    " Align bottom
	nmap <Leader>b zb
    " Align mid
	nmap <Leader>m zz

    "Open terminal command
    nmap C :!  

    " Drupal maps
    nmap cr :! drush cr<CR>

    "Blamer Toggle
    nmap <Leader>bt :BlamerToggle<CR>

    " Maps double i to escape
    ":imap ii <Esc>

    " Copy to system clipboard
    noremap <S-y> "+y

    " Remove endline
    noremap <C-j><C-j> :,+j<CR>

    " Escape from terminal with <Esc>
    "tnoremap <Esc> <C-\><C-n>


    " Fix error sugestions
    nnoremap  <S-f> :CocFix<CR>

    " Run any language
    nnoremap RR :call Run()<CR>

    function Run()
        let extension = expand('%:e')
        if extension == 'c'
           :execute ":! gcc % && ./a.out" 
        elseif extension == 'php'
           :execute ":! php %" 
        elseif extension == 'cpp'
           :execute ":! g++ % && ./a.out" 
        elseif extension == 'py'
           :execute ":! python3 %" 

        elseif extension == 'js'
           :execute ":! node %" 

        elseif extension == 'hs'
           :execute ":! runhaskell %" 
        elseif extension == 'rb'
           :execute ":! ruby %" 
        else
            echomsg "Run(): Error - Application not found for this language."
        endif
    endfunction

    " Compile any language
    nnoremap CC :call Compile()<CR>

    function Compile()
        let extension = expand('%:e')
        if extension == 'c'
           :execute ":! gcc %" 
        elseif extension == 'cpp'
           :execute ":! g++ %" 
        else
            echomsg "Compile(): Error - Compiler not found for this language."
       endif
    endfunction

" PLUGINS VIM-PLUG
    call plug#begin('~/.vim/plugged')
        " Themes
        Plug 'morhetz/gruvbox'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
        "Plug 'itchyny/lightline.vim' "Barra inferior tuneada
        Plug 'yuezk/vim-js'
        Plug 'maxmellon/vim-jsx-pretty'
        " Barra inferior
        Plug 'APZelos/blamer.nvim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        " IDE
        Plug 'easymotion/vim-easymotion'
        Plug 'scrooloose/nerdtree'
        Plug 'christoomey/vim-tmux-navigator'
        " Use release branch (recommend)
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
        Plug 'jparise/vim-graphql'

        " Search files
        Plug 'junegunn/vim-easy-align'
        Plug 'junegunn/fzf.vim'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

        " Atajos
        Plug 'mattn/emmet-vim'
        Plug 'preservim/nerdcommenter'
        
        " Git
        Plug 'tpope/vim-fugitive'
    call plug#end()

"VUNDLE PLUGINS
    set nocompatible              " be iMproved, required
    filetype off                  " required
    filetype plugin indent on    " required
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.config/nvim/Vundle.vim
    call vundle#begin()
        "Enable Vundle
        Plugin 'VundleVim/Vundle.vim'
        Plugin 'mileszs/ack.vim'
        Plugin 'nelsyeung/twig.vim' "Twig syntax highlight
        "Rainbow brackets
        Plugin 'frazrepo/vim-rainbow'

        " Autoclose pairs
        Plugin 'spf13/vim-autoclose'

    call vundle#end()            " required
    filetype plugin on

"ESTILOS
    set guifont=DejaVu\ Sans\ Mono
	syntax enable "Subrayado de sintaxis
	set numberwidth=1
	set showcmd "muestra los comando que estoy ejecutando
	set ruler "mostrar numero de linea (por defecto en nvim)
	set laststatus=2 "muestra la barra (no esta por defecto en vim)
	syntax on
	"let g:rainbow_active = 1 "Enable rainbow brackets
	set cursorline
    " Onehalfdark with a fix for the dialogs
    colorscheme onehalfdark | hi Pmenu ctermfg=78 guibg=236 ctermbg=237

    "colorscheme onehalflight 
    "hi DiffAdd cterm=bold  ctermbg=15 gui=reverse 
    "hi DiffDelete cterm=bold  ctermbg=15 gui=reverse 
    "hi DiffChange cterm=bold  ctermbg=15 gui=reverse 

    "colorscheme gruvbox
    "hi DiffAdd cterm=bold  ctermbg=237 gui=reverse 
    "hi DiffDelete cterm=bold  ctermbg=237 gui=reverse 
    "hi DiffChange cterm=bold  ctermbg=237 gui=reverse 

    "Transparent background
    hi Normal guibg=NONE ctermbg=NONE

    au BufReadPost *.theme set syntax=php " set syntax to php for drupal theme files
    au BufReadPost *.install set syntax=php " set syntax to php for drupal module install files
    au BufReadPost *.module set syntax=php " set syntax to php for drupal module files

" COC AUTOCOMPLETION
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    "xmap <leader>f  <Plug>(coc-format-selected)
    "nmap <leader>f  <Plug>(coc-format-selected)

