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
"Plugin 'Firef0x/matchit'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin '2072/vim-syntax-for-PHP'
Plugin 'HTML-AutoCloseTag'
Plugin 'SirVer/ultisnips'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'alexander-alzate/vawa.vim'
Plugin 'alexander-alzate/vim-color-hour'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'flazz/vim-colorschemes'
Plugin 'genutils'
Plugin 'godlygeek/tabular'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lookupfile'
Plugin 'majutsushi/tagbar'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sniphpets/sniphpets'
Plugin 'sniphpets/sniphpets-common'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'tomtom/checksyntax_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/taglist.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" UltiSnips Configuration
"------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set the author name
let g:snips_author=$AUTHOR
let g:snips_copy=$COPY

" PDV 2 (PDV - PHP Documentor for VIM - 2)
"-----------------------------------------
let g:pdv_template_dir=$HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-S> :call pdv#DocumentWithSnip()<CR>
nnoremap <C-P> :call pdv#DocumentWithSnip()<CR>
inoremap <C-P> <ESC>:call pdv#DocumentWithSnip()<CR>i

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

" Vim Indent Guides
" -----------------
let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Lookupfiles
" -----------
" Maps
nmap <unique> <silent> <F3> <Plug>LookupFile
imap <unique> <silent> <F3> <C-O><Plug>LookupFile

" Tabular
" -------
" For PHP array assignment and regular assignment.
" NOTE: tabular comes with a default tabular pattern for 'assignment'
vmap <unique> <silent> <F8> :Tabularize /^[^=]*\zs=>\?/l1c1l0<CR>

" Session
" -------
set sessionoptions-=options
set sessionoptions-=help

" Misc Configuration
"------------------

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" indentation
set list lcs=tab:\¦˲

syntax on
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set hls
set textwidth=80
set fo+=orj
let mapleader=","

let &colorcolumn="80,".join(range(110,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Refresh without higlights
imap <C-L> <ESC>:noh<CR>a
map <C-L> :noh<CR>

" QUESTION: Should be loaded from env?
map <Leader>t :!gnome-terminal<Esc>

