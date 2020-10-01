" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

" Better sintax
Plug 'sheerun/vim-polyglot'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Linting and Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" File fuzzing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File explorer
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

" Themes
Plug 'gruvbox-community/gruvbox'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Tagbar
Plug 'liuchengxu/vista.vim'

" Git
Plug 'tpope/vim-fugitive'

" Scroll
Plug 'psliwka/vim-smoothie'

" Quick Jump
Plug 'easymotion/vim-easymotion'

" Commenting
Plug 'preservim/nerdcommenter'

" Time Tracking
Plug 'wakatime/vim-wakatime'

" Time Tracking
Plug 'machakann/vim-sandwich'

" Undo
Plug 'mbbill/undotree'

" Latex
Plug 'lervag/vimtex'

call plug#end()

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

" " Theme
set termguicolors
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']

" AutoGroups
" augroup LineNumbers
    " autocmd!
    " autocmd InsertEnter * :set number
    " autocmd InsertLeave * :set relativenumber
" augroup END

augroup CursorLine
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

augroup Indentation
    autocmd!
    au BufRead,BufNewFile *.py set expandtab
    au BufRead,BufNewFile *.c set noexpandtab
    au BufRead,BufNewFile *.h set noexpandtab
    au BufRead,BufNewFile Makefile* set noexpandtab
augroup END

augroup GitCommitFormat
    autocmd!
    autocmd FileType gitcommit set textwidth=72
    set colorcolumn=+1
    autocmd FileType gitcommit set colorcolumn+=51
augroup END

augroup NoPasteAfterLeavingInsertMode
    autocmd!
    au InsertLeave * silent! set nopaste
augroup END

augroup GoyoConfig
    autocmd!
    autocmd User GoyoEnter Limelight0.2 | call <SID>goyo_enter()
    autocmd User GoyoLeave Limelight! | call <SID>goyo_leave()
augroup END


" Goyo
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction


" Remappings
"
nnoremap ; :

" Scroll
nnoremap <C-i> <C-d>
nnoremap <C-o> <C-u>

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" File tree
nmap sf :VimFilerBufferDir<Return>
nmap sF :VimFilerExplorer -find<Return>
nmap sb :Unite buffer<Return>

" Set , as leader
let mapleader = ","

" Quickly edit important configs
nnoremap <leader>ev :drop ~/.config/nvim/init.vim<cr>
nnoremap <leader>et :drop $XDG_CONFIG_HOME/tmux/tmux.conf<cr>
nnoremap <leader>ed :drop $XDG_CONFIG_HOME/zsh/.zshrc<cr>

" Make U do the opposite of u
nnoremap U <C-r>

" Make K split the current line at the cursor (the opposite of J)
nnoremap K i<CR><Esc>

" Quickly save, only writing the file if there are changes
nnoremap <leader>w :up<CR>

" Create splits
nnoremap sv <C-w>v <CR>
nnoremap ss <C-w>s <CR>

" FZF mappings
nnoremap <C-p> :GFiles<CR>
nnoremap <C-p>. :Files<CR>
nnoremap <C-p>.. :Files ../..<CR>
nnoremap <leader>b :Buffers<CR>

" Git Mappings
nnoremap <leader>g :Git<CR>
nnoremap go :.Gbrowse<CR>
vnoremap go :'<,'>.Gbrowse<CR>
nnoremap gs :Git<CR>

" Quickly select the text you just pasted
nnoremap gV `[v`]

" Automatically jump to end of pasted text
noremap <silent> p p`]
nnoremap <silent> p p`]

" Distraction Free Mode
nnoremap <silent> <leader>z :Goyo<cr>

" Traverse buffer list more easily.
nnoremap < :bprevious<CR>
nnoremap > :bnext<CR>
nmap <Space> <C-w>w

" Easily move between panes
nnoremap <silent> sh <C-w>h
vnoremap <silent> sh <C-w>h
nnoremap <silent> sj <C-w>j
vnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
vnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
vnoremap <silent> sl <C-w>l

" Make j and k operate on virtual lines, not real lines.
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Jump to anywhere on screen with minimal keystrokes `s{char}{char}{label}`
nmap m <Plug>(easymotion-overwin-f2)

" Toggle file browser, undotree and Vista tagbar
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <Leader>v :Vista!!<CR>

" Turn off search highlighting
nnoremap sn :noh<CR>


" vim-pandoc-syntax
let g:pandoc#syntax#conceal#urls = 0
let g:pandoc#syntax#conceal#blacklist = [ "codeblock_start", "codeblock_delim", "image", "block" ]
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#codeblocks#embeds#langs = [ "python", "c", "bash=sh" ]

" Undotree
let g:undotree_SetFocusWhenToggle = 1

"Easymotion
let g:EasyMotion_smartcase = 1


" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"
" Coc
let g:coc_node_path = "/usr/bin/node"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use H to show documentation in preview window
nnoremap <silent> H :call <SID>show_documentation()<CR>


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mapping for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Mapping for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Mapping for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Mapping for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)


" Python
let python_highlight_all=1
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

" Texlive
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Tex-conceal
set conceallevel=1
let g:tex_conceal='abdmg'

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'markdown', 'pandoc', 'rst', 'tex', 'text']
let g:airline#extensions#wordcount#enabled = 1

" file tree
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'
