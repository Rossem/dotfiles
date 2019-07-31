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
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ayu-theme/ayu-vim'

call plug#end()


set autoread
au FocusGained * :checktime

" Disable neovim style cursor.
set guicursor=

filetype plugin indent on
set clipboard=unnamed
set colorcolumn=80
set number
set background=dark

" Colorscheme
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Tab specific option
set tabstop=8      "A tab is 8 spaces
set expandtab      "Always uses spaces instead of tabs
set softtabstop=4  "Insert 4 spaces when tab is pressed
set shiftwidth=4   "An indent is 4 spaces
set shiftround     "Round indent to nearest shiftwidth multiple<Paste>

" Format elixir files on save.
" let g:mix_format_on_save = 1

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
nnoremap <leader>m :MixFormat<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" FZF settings
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:virtualenv_directory = '.'

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

" Haskell settings
let g:haskell_indent_do = 4
let g:haskell_indent_if = 4
let g:haskell_indent_in = 0
let g:haskell_indent_let = 4
let g:haskell_indent_case = 4
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 4
