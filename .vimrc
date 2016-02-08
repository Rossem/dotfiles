set shell=bash "fish

" Leader mappings
let mapleader = " "
nnoremap <leader>w <C-w>w
nnoremap <leader>p :tabp<CR>
nnoremap <leader>n :tabn<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'itchyny/landscape.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'morhetz/gruvbox'
Plugin 'guns/vim-clojure-static'

call vundle#end() 

set nocompatible
set ruler
set cursorline

execute pathogen#infect()
syntax on
filetype off
filetype plugin indent on

set encoding=utf-8 "UNICODE GLYPHS
set nobackup 

syntax enable
set number
set showcmd
set hlsearch
set showmode
set wildmenu

set laststatus=2 "for powerline
set expandtab
set shiftwidth=4
set tabstop=4

set autoindent
set pastetoggle=<F2>

"Molokai stuff
set t_Co=256
set rnu

" ctrl-p settings
let g:ctrlp_working_path_mode = 'ra'

set background=dark
colo jellybeans
