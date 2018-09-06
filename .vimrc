call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tomasr/molokai'

let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"

call plug#end()

filetype plugin indent on

let g:rustfmt_autosave = 1

set noswapfile
set nobackup 
set nowb

" set rnu
set number
set clipboard=unnamed
set showcmd
set showmode
set wildmenu
set autoread
set backspace=2
set pastetoggle=<F2>

" Indentation
set expandtab
set laststatus=2
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set backspace=indent,eol,start

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Quit when the only window open is NERDTree
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" Colorscheme
syntax on
colo molokai

" Leader mappings
let mapleader = " "

nnoremap <leader>w <C-w>w
nnoremap <leader>p :tabp<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>h :noh<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
