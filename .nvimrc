call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomasr/molokai'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-eunuch'
Plug 'zxqfl/tabnine-vim'

call plug#end()


set autoread
au FocusGained * :checktime

set clipboard=unnamed
set colorcolumn=80
set number
colo molokai

" Don't indent the line when `:` is typed.
:setlocal indentkeys-=:

" Leader mappings
let mapleader = " "

nnoremap <leader>w <C-w>w
nnoremap <leader>p :tabp<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>s :w<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" FZF settings
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Search settings
set ignorecase
set smartcase
