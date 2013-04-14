set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'jnwhiteh/vim-golang'
Bundle 'pangloss/vim-javascript'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/Rename'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'

filetype plugin indent on

" Set the font for MacVim
if has('gui_running')
 set guifont=Menlo:h11
 set antialias
endif

" Allow vim to hide buffers with changes
set hidden

" Show line numbers
set number
set numberwidth=4                       " Set line number column width 

" WindowAndBufferManagement:

set splitbelow                          " Open new horizontal split windows below current
set splitright                          " Open new vertical split windows to the right

" Map Leader: Reset from \ to ,
let mapleader = ","

" Always show status bar
set laststatus=2

set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%{rvm#statusline()}\ "
set statusline+=%{fugitive#statusline()}\ "
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :AckFromSearch!<cr>

nnoremap <C-W>V :vertical bo split<CR>

"Color column 81
set colorcolumn=81

" Gists should be priavte by default
let g:gist_post_private = 1
let g:gist_clip_command = 'pbcopy'

let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window_bottom = 1

" copy current file path to the system clipboard
nmap <leader>c :let @* = expand("%:p")<cr>

" edit file in directory of current file
nmap <leader>e :split <C-R>=expand("%:h").'/'<CR><BS>/

set background=light "light or dark
colorscheme solarized

" use indents of 2 spaces, and have them copied down lines:
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
