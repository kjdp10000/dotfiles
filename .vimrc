" VIM config
" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible

filetype plugin indent on
syntax on                               "Syntax highlighting
set number relativenumber               "Line numbers
set softtabstop=4 tabstop=4
set shiftwidth=4
set expandtab                           "convert tabs to space
set smarttab    
set smartindent                         "try to indent for me
set nowrap                              "don't screen wrap
set smartcase
set incsearch                           "display search results as you type
set title
set ruler
set showcmd                             "Show commmand
"set cursorline                         "highlight the cursor location
filetype indent on                      "Filetype detection
set showmatch                           "Highlight matching brackets
set wildmenu                            "Better command-line completion
set wildmode=longest,list,full
"set relativenumber                      "Relative numbering 

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
set encoding=utf8                       "set encoding so glyphs can be displayed in VIM

hi CursorLineNr cterm=bold

" +------------------+
" |  Key bindings    |
" +------------------+
let mapleader = " "                     "map leader to Space

inoremap jj <Esc> 

" enable copy/paste using system clipboard
vnoremap <C-c> "+y
map <C-p> "+p

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

" split: moving between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" +-------------------------+
" | Leader Key bindings  	|
" +-------------------------+
" turn off highlighting
map <leader>h :noh<CR>
map <leader>H :set hlsearch<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <leader>u :UndotreeShow<CR>

" add quotes around word
:nnoremap <Leader>"" ciw""<Esc>P
:nnoremap <Leader>'' ciw''<Esc>P
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P
:vnoremap <leader>" c""<esc>P

" makes Ascii art font
nmap <leader>F :.!toilet -w 200 -f standard<CR>
nmap <leader>f :.!toilet -w 200 -f small<CR>
" makes Ascii border
nmap <leader>1 :.!toilet -w 200 -f term -F border<CR>


" +-------------------------+
" | macros                	|
" +-------------------------+
"let @q='ctrl + r ctrl + r q'
" replace single quotes with double quotes

