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
Plugin 'HTML-AutoCloseTag'
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
Plugin 'spf13/PIV'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'tomtom/checksyntax_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ultisnips'
Plugin 'vim-scripts/taglist.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Set color scheme according to current time of day.
" SEE: http://vim.wikia.com/wiki/Switch_color_schemes
let hr = str2nr(strftime('%H'))
if hr <= 3
	let i = 0
elseif hr <= 7
	let i = 1
elseif hr <= 14
	let i = 2
elseif hr <= 18
	let i = 3
else
	let i = 4
endif
let nowcolors = 'xoria256 jellybeans twilight two2tango wombat'
execute 'colorscheme '.split(nowcolors)[i]
redraw

" UltiSnips Configuration
"------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set the author name
let g:snips_author = "Alexander Alzate < alexander dot hospitec at hotmail dot com >"
let g:snips_copy = "© 2015 Hospitec S.I S.A.S"

" PDV 2 (PDV - PHP Documentor for VIM - 2)
"-----------------------------------------
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-S> :call pdv#DocumentWithSnip()<CR>
nnoremap <C-P> :call pdv#DocumentWithSnip()<CR>
inoremap <C-P> <ESC>:call pdv#DocumentWithSnip()<CR>i

" Tagbar Options and Configuration
"--------------------------------
" Tagbar plugin map
nnoremap <silent> <F9> :TagbarToggle<CR>

"Sort according to their orther in the source file
let g:tagbar_sort = 0

" Show line numbers in the Tagbar windows
" let g:tagbar_show_linenumbers = 2

" NERDTree Options and Configuration
"----------------------------------
map <F12> :NERDTreeToggle<CR>

" Closes NERDTree whether it is the left open window
autocmd bufenter *
		\ if (winnr("$") == 1 && exists("b:NERDTreeType") &&
		\ b:NERDTreeType == "primary") | q | endif

let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1

" Vim Indent Guides
" -----------------
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Lookupfiles
" -----------
" Maps
nmap <unique> <silent> <F3> <Plug>LookupFile
imap <unique> <silent> <F3> <C-O><Plug>LookupFile

" Tabular
" -------
vmap <unique> <silent> <F8> :Tabularize /=<CR>

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

" Indent lvl
set list lcs=tab:¦›

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
