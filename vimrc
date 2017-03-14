source $VIMRUNTIME/defaults.vim

" Vundle Configuration
" --------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle Plugins
Plugin '2072/vim-syntax-for-PHP'
Plugin 'SirVer/ultisnips'
Plugin 'alexander-alzate/nerdtree'
Plugin 'alexander-alzate/vim-color-hour'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" UltiSnips Configuration
"------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Set personal snippets directory
let g:UltiSnipsSnippetsDir=$HOME."/.vim/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Tagbar Options and Configuration
"--------------------------------
" Tagbar plugin map
nnoremap <silent> <F9> :TagbarToggle<CR>

"Sort according to their orther in the source file
let g:tagbar_sort=0
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_foldlevel=2

" Show line numbers in the Tagbar windows
" let g:tagbar_show_linenumbers=2

" NERDTree Options and Configuration
"----------------------------------
map <F12> :NERDTreeToggle<CR>

" Closes NERDTree whether it is the left open window
autocmd BufEnter,BufWinEnter *
			\ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
				\ | q
			\ | endif

let NERDTreeBookmarksFile=$HOME."/.vim/NERDTreeBookmarks"
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1

" NERDCommenter and Configuration
"----------------------------------
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

" Tabular
" -------
" For PHP array assignment and regular assignment.
" NOTE: tabular comes with a default tabular pattern for 'assignment'
vmap <unique> <silent> <F8> :Tabularize /^[^=]*\zs=>\?/l1c1l0<CR>

" Syntastic Configuration
" -----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Personal Configuration
"------------------

" Options
set list lcs=tab:\¦˲
set formatoptions+=orj
set textwidth=80

set hidden
set hlsearch

set number

set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

let mapleader=","

" Custom autocomands
let &colorcolumn="80,".join(range(110,999),",")
autocmd VimEnter * highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Custom mappings
" Refresh without higlights
imap <C-L> <ESC>:nohlsearch<CR>a
map <C-L> :nohlsearch<CR>

" QUESTION: Should be loaded from env?
map <Leader>t <ESC>:!gnome-terminal<CR><ESC>

" Delete shortcuts
imap <C-K> <ESC>ddi
nmap <C-K> dd

