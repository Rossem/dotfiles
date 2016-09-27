set shell=bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-endwise'
" Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'altercation/vim-colors-solarized'

call vundle#end() 
filetype plugin indent on

runtime macros/matchit.vim " match ruby ends with %

syntax on

set encoding=utf-8 "UNICODE GLYPHS

set noswapfile
set nobackup 
set nowb

set number
set clipboard=unnamed
set showcmd
set showmode
set wildmenu
set autoread
set backspace=2
set pastetoggle=<F2>

" Performance

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
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Colorscheme
syntax on
set background=dark
set t_Co=256
colorscheme solarized

" GUI Options
set guioptions+=LlRrbT
set guioptions-=LlRrbT
set guifont=Monaco:h12

" Leader mappings
let mapleader = " "

nnoremap <leader>w <C-w>w
nnoremap <leader>p :tabp<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>f :FZF<CR>
