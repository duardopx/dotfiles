set secure
set modeline
set spelllang=en
set mouse=nv
set nostartofline
set title
set autoread

set clipboard=unnamedplus
set noshowmode
set scrolloff=6
set number
set cmdheight=1
set updatetime=300
set cursorline
set hidden
set nobackup
set splitbelow
set splitright
set signcolumn=yes
set shortmess+=c
set fillchars+=fold:.
syntax on

" Tab completion menu
set wildmenu
set wildmode=full

" Undo
set undolevels=1000
set undofile

" Jump to files with these extensions
set suffixesadd=.md,.c,.h,.cpp,.py,.tex

set tags=tags

" Assembly highlight
set ft=nasm

" Don't treat hyphens and underscores like whitespace
set iskeyword+=-
set iskeyword+=_

" Search 
set showmatch
set matchtime=0
set incsearch
set hlsearch
set ignorecase
set inccommand=nosplit
set smartcase

" Line breaking 
set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40
highlight ColorColumn ctermbg=0
set colorcolumn=81,121

" Indentation
set copyindent
set preserveindent
filetype plugin indent on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

