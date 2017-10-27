" Autostart NERDTree
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w

" Vundle plugin manager section
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" optional Packages 
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'drmingdrmer/xptemplate'
Plugin 'derekwyatt/vim-scala'
Plugin 'lervag/vim-latex'
Plugin 'klen/python-mode'
" File Explorer
Plugin 'scrooloose/nerdtree'
" NerdTree git integration
" Only works if the git project is opened as root folder
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'gnuplot.vim'
" Code Linting
Plugin 'scrooloose/syntastic'
"Plugin 'powerline/powerline'
" close brakets automatically
Plugin 'Raimondi/delimitMate'
""""" Javascript
" Syntax Highlighting
Plugin 'pangloss/vim-javascript'
" Jade Highlighting
Plugin 'digitaltoad/vim-jade'
" Git Integration
"Plugin 'airblade/vim-gitgutter'
" Autocompletion Engine
"Plugin 'Valloric/YouCompleteMe'

" next two lines are required by vundle
call vundle#end()            " required
filetype plugin indent on    " required

" Powerline setup
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"set laststatus=2

" Syntastic START
let g:syntastic_javascript_checkers = ['standard']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic END

set splitbelow
set splitright

" statusline
set laststatus=2
set statusline=%f

syntax on
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab

" Highlight search results
set hlsearch
