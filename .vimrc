" .vimrc

" Basic setup {{{

set nocompatible                        " enter the current millenium

filetype plugin indent on               "Filetype detection
syntax on                               "Syntax highlighting

set number relativenumber
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
set showmatch                           "Highlight matching brackets
set wildmenu                            "Better command-line completion
set wildmode=longest,list,full          "Auto completion
set hlsearch
set encoding=utf8                       "set encoding so glyphs can be displayed in VIM
set mouse=a                             "enable mouse
set splitbelow splitright               "open new window right/below


hi CursorLineNr cterm=bold

" }}}
" Leader {{{

let mapleader = ","

" }}}
" Key bindings {{{

inoremap jj <Esc> 

" enable copy/paste using system clipboard
vnoremap <C-c> "+y
map <C-p> "+p

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

" split: moving between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
map <C-k> <C-w>k
nmap <C-l> <C-w>l

" turn off highlighting
map <leader>h :noh<CR>
map <leader>H :set hlsearch<CR>

" nnoremap <Leader>+ :vertical resize +5<CR>
" nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <c-left> :vertical resize +5<CR>
nnoremap <c-right> :vertical resize -5<CR>
nnoremap <c-up> :horizontal resize +5<CR>
nnoremap <c-down> :horizontal resize -5<CR>

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

nnoremap <leader>u :UndotreeShow<CR>

" change case
nnoremap <Leader>uu gUiw
inoremap <Leader>uu <esc>gUiwea
nnoremap <Leader>ll guiw
inoremap <Leader>ll <esc>guiwea

" substitute
nnoremap <leader>s :%s//<left>

" vimdiff off
nnoremap <leader>vd :diffoff!<cr>

" add quotes around word
:nnoremap <Leader>"" ciw""<Esc>P
:nnoremap <Leader>'' ciw''<Esc>P
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P
:vnoremap <leader>" c""<esc>P

" Check file in shellcheck:
map <leader>sc :set spell!<CR>

" }}}
" ASCII art {{{
" makes Ascii art font
nmap <leader>F :.!toilet -w 200 -f standard<CR>
nmap <leader>f :.!toilet -w 200 -f small<CR>
" makes Ascii border
nmap <leader>1 :.!toilet -w 200 -f term -F border<CR>

" }}}
" theme {{{
" https://draculatheme.com/vim
if v:version < 802
    packadd! dracula
endif
syntax enable
colorscheme dracula

" }}} 
" folding {{{
set foldlevelstart=0
set foldcolumn=1
set foldmethod=marker
nnoremap <leader><Space> za
vnoremap <leader><Space> za

set foldtext=MyFoldText()
function MyFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    return v:folddashes .. sub
endfunction

" }}}

