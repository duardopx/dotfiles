" ====================================================================== "
" ===============	      Plugins                    =============== "
" ====================================================================== "

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox' 
Plug 'junegunn/goyo.vim'    
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdtree'     
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

call plug#end()   


" ====================================================================== "
" ===============	      Options Setup	 	 =============== "
" ====================================================================== "


" Remap leader key to ,
let g:mapleader=','

" Disable line numbers
set nonumber

" Don't show last command
set noshowcmd

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=4

" Indentation amount for < and > commands.
set shiftwidth=4

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=1


" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c



" ====================================================================== "
" ===============	      Plugins Setup	 	 =============== "
" ====================================================================== "
try

" === NERDTree === "
" Show hidden files/directories
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" === Groove Box Color scheme ===
set background=dark                                                                                                                                              
let g:gruvbox_italic=1                                                                                                                                           
let g:gruvbox_contrast_dark='hard'                                                                                                                               
colorscheme gruvbox 

" === Coc === "

" === Denite === "

endtry
" ====================================================================== "
" ===============	      Misc                       =============== "
" ====================================================================== "

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number relativenumber

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif


" ====================================================================== "
" ===============	      Key Mapping                =============== "
" ====================================================================== "




" Open current directory
nmap te :tabe<Return>

" List tabs
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Split window
 nmap ss :split<Return><C-w>w
 nmap sv :vsplit<Return><C-w>w" Move window

" Move window
 map sh <C-w>h
 map sk <C-w>k
 map sj <C-w>j
 map sl <C-w>l" Switch tab

" Switch tab
 nmap <S-Tab> :tabprev<Return>
 nmap <Tab> :tabnext<Return>

" Resize window
 nmap <C-w><left> <C-w><
 nmap <C-w><right> <C-w>>
 nmap <C-w><up> <C-w>+
 nmap <C-w><down> <C-w>-
 
"Mapp
 nmap qq :q<Return>
 nmap tt :below terminal<Return>

" ====================================================================== "
" ===============	      Sintaxe                    =============== "
" ====================================================================== "

" === sintaxe ===
syntax on
set magic
set hlsearch
set incsearch
