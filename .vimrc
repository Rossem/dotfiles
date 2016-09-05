set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'

" Colorschemes
Plugin 'sjl/badwolf'

call vundle#end() 
filetype plugin indent on

syntax on

set encoding=utf-8 "UNICODE GLYPHS

set noswapfile
set nobackup 
set nowb

set ruler
set clipboard=unnamed " use system clipboard
set cursorline
set number
set showcmd
set showmode
set wildmenu
set rnu
set backspace=2
set pastetoggle=<F2>

" Performance
set ttyfast
set lazyredraw

" Indentation
set laststatus=2 "for powerline
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
set backspace=indent,eol,start

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" ctrl-p settings
let g:ctrlp_working_path_mode = 'ra'

" Colorscheme
syntax on
colorscheme badwolf

" Leader mappings
let mapleader = " "

nnoremap <leader>w <C-w>w
nnoremap <leader>p :tabp<CR>
nnoremap <leader>n :tabn<CR>
