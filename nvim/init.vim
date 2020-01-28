call plug#begin('~/.vim/plugged')

" Syntax Highlighting, Linting and Completion
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File explorers
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Writing-related
Plug 'szw/vim-dict'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Themes
Plug 'gruvbox-community/gruvbox'

" General Appearance
Plug 'ryanoasis/vim-devicons'

" Tagbar
Plug 'liuchengxu/vista.vim'

" Register Preview
Plug 'junegunn/vim-peekaboo'

" Delimiters
Plug 'jiangmiao/auto-pairs'

" Surrounding text
Plug 'tpope/vim-surround'

" Git and GitHub
Plug 'airblade/vim-gitgutter'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" RipGrep
Plug 'jremmen/vim-ripgrep'

" Quick Jump
Plug 'easymotion/vim-easymotion'

" TimeTracking
Plug 'wakatime/vim-wakatime'

" Undo
Plug 'mbbill/undotree'

" Comment
Plug 'tpope/vim-commentary'

call plug#end()

" Remap esc to caps
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" General Settings

set secure
set modeline
set spelllang=en
set mouse=nv                    " Use mouse for pane selection, resizing, and cursor movement.
set nostartofline               " Don’t reset cursor to start of line when moving around.
set title                       " Show the filename in the window titlebar
set autoread                    " Autoread changed files
set clipboard=unnamed           " Enable copying to macOS clipboard
set noshowmode                  " Don't show mode under statusline w/ mode
set scrolloff=6                 " Minimal num of lines to keep above/below cursor
set number                      " Enable line numbers
set cmdheight=1                 " Better display for messages
set updatetime=300              " Smaller updatetime for CursorHold & CursorHoldI
set cursorline                  " Highlight current line
set hidden                      " Enable buffers to exist in the background
set nobackup                    " Don't keep a backup file. writebackup is enough for my purposes.
set splitbelow                  " Open new horizontal splits to the bottom
set splitright                  " And vertical splits to the right
set signcolumn=yes              " Always show signcolumns
set switchbuf=usetab            " Search first in opened windows if opening buffer
set shortmess+=c                " Don't give ins-completion-menu messages
set backspace=indent,eol,start  " Make delete in insert mode behave as expected.
set timeoutlen=1000 ttimeoutlen=0 " Remove delay in escapekey
set fillchars+=fold:. " for folds
syntax on

" Tab completion menu
set wildmenu
set wildmode=full
set wildignore+=.svn,CVS,.git,*.pyc,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*/tmp/*,*.zip,log/**,node_modules/**,target/**,tmp/**,*.rbc


set undolevels=1000  " store a bunch of undo history
set undofile


" Use gtf to jump to files with these extensions
set suffixesadd=.md,.c,.h,.cpp,.py,.tex

set tags=tags

" Don't treat hyphens and underscores like whitespace
set iskeyword+=-
set iskeyword+=_

" Search

set showmatch             " Show matching brackets/parenthesis
set matchtime=0           " Don't blink when matching
set incsearch             " Find as you type search
set hlsearch              " Highlight search terms
set ignorecase            " Case insensitive search
set inccommand=nosplit    " Show regex replacement changes as you're typing
set smartcase             " Case sensitive if we type an uppercase


" Line breaking

set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40
highlight ColorColumn ctermbg=237
set colorcolumn=81   " 80 and 120 character guidelines



" Indentation

set copyindent
set preserveindent
filetype plugin indent on

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new lineet noexpandtab



" Appearance

set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


" Make vertical splits prettier
set fillchars+=vert:┃
highlight VertSplit guifg=9


" Vim Dev Icons

let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 0


" Vista

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']



" AutoGroups

augroup AutoCloseVim
    autocmd!
    " Close vim if the quickfix window is the only window visible (and only tab)
    " https://stackoverflow.com/a/7477056
    autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | quit | endif
    " Close vim if only thing remaining is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif
    " TODO: Close vim if all that remains is a no-name buffer
augroup END


augroup RestoreCursorPositionWhenOpeningFile
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \ endif
augroup END

" Automatically use absolute line numbers when we’re in insert mode
" and relative numbers when we’re in normal mode.
augroup LineNumbers
    autocmd!
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
augroup END

augroup Indentation
    autocmd!
    " configure expanding of tabs for various file types
    au BufRead,BufNewFile *.py set expandtab
    au BufRead,BufNewFile *.c set noexpandtab
    au BufRead,BufNewFile *.h set noexpandtab
    au BufRead,BufNewFile Makefile* set noexpandtab
augroup END

augroup SetCorrectFiletype
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=pandoc
    autocmd BufRead,BufNewFile *.txt set filetype=text
augroup END

augroup MarkdownConcealing
    autocmd!
    autocmd FileType markdown set conceallevel=0
augroup END


augroup NoPasteAfterLeavingInsertMode
    autocmd!
    au InsertLeave * silent! set nopaste
augroup END

" tbh not sure if this should stay
augroup coc-config
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-texlab',
  \ 'coc-emmet'
  \ ]


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Functions
function! ToggleNerdTree() abort
    :NERDTreeToggle
    :AirlineRefresh
endfunction


" === Remappings
" Set , as leader and - as localleader
let mapleader = ","

" Quickly edit important configs
nnoremap <leader>ev :drop ~/.config/nvim/init.vim<cr>
nnoremap <leader>et :drop ~/.tmux.conf<cr>
nnoremap <leader>ez :drop ~/.zshrc<cr>


" Split window
nmap ss :split<Return><C-w>
nmap sv :vsplit<Return><C-w>

" Switch window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

nmap - :tabprev<Return>
nmap = :tabnext<Return>



" Yeet those 'Not an editor command' errors right out the fucking window
" Or, defenestrate, as my Dad would say.
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! Qa qa


" Make U do the opposite of u (redo)
nnoremap U <C-r>

" Save one chracter when saving, and only write if there are changes
nnoremap <leader>w : w<CR>

" Exit from close file quickli
nnoremap <leader>q : q!<CR>

" Exit from close file quickli
nnoremap <leader>x :x<CR>

nnoremap <leader>te :tabnew<cr>

" FZF mappings
nnoremap <C-p> :Files<CR>
nnoremap <C-p>. :Files ..<CR>
nnoremap <C-p>.. :Files ../..<CR>
nnoremap <C-p>... :Files ../../..<CR>

" Check File buffers
nnoremap <leader>b :Buffers<CR>

" Toggle file browser, undotree and Vista tagbar
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>f :call ToggleNerdTree()<CR>
nnoremap <Leader>v :Vista!!<CR>

" Goyo
nnoremap <silent> <leader>G :Goyo<cr>

 " Undotree
let g:undotree_SetFocusWhenToggle = 1


" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeStatusline = 0


" vim-easymotion
let g:EasyMotion_smartcase = 1


" vim-airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
