" # Extend From Defaults
source $VIMRUNTIME/defaults.vim

" # Plugin Manager Configuration
let VIM_PROJECTS_DIR = (
			\ strlen($XDG_PROJECTS_DIR)
			\ ? $XDG_PROJECTS_DIR
			\ : $HOME . '/Projects'
		\ ) . '/vim'

call plug#begin(VIM_PROJECTS_DIR)

" ## File type plugins
Plug '2072/vim-syntax-for-PHP', { 'for': 'php' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" ## Misc plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'alexander-alzate/nerdtree'
Plug 'alexander-alzate/vim-color-hour'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()

" # UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ## Set personal snippets directory
let g:UltiSnipsSnippetsDir=$HOME."/.vim/UltiSnips"

" ## Tell :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" # Tagbar Options and Configuration
" ## Mappings
nnoremap <silent> <F9> :TagbarToggle<CR>

" ## Configuration
let g:tagbar_sort=0
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_foldlevel=2

" # NERDTree
" ## Mappings
map <F12> :NERDTreeToggle<CR>

" ## Closes NERDTree whether it is the left open window
autocmd BufEnter,BufWinEnter *
			\ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
				\ | q
			\ | endif

" ## Configuration
let NERDTreeBookmarksFile=$HOME."/.vim/NERDTreeBookmarks"
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1

" # NERDCommenter
" ## Configuration
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

" # Tabular
" ## Mappings
" ### For PHP array and regular assignments.
vmap <unique> <silent> <F8> :Tabularize /^[^=]*\zs=>\?/l1c1l0<CR>

" # Syntastic
" ## Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" # Personal Configuration
" ## Options
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

" ## Autocomands
let &colorcolumn="80,".join(range(110,999),",")
autocmd VimEnter * highlight ColorColumn ctermbg=235 guibg=#2c2d27

" ## Mappings
" ### Refresh without higlights
imap <C-L> <ESC>:nohlsearch<CR>a
map <C-L> :nohlsearch<CR>

" ### Open terminal emulator
map <Leader>t <ESC>:!gnome-terminal<CR><ESC>

" ### Delete current line
imap <C-K> <ESC>ddi
nmap <C-K> dd

