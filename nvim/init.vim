" Plugins {{{

call plug#begin('~/.vim/plugged')

" Dependency for gist-vim
Plug 'mattn/webapi-vim'
"
" Syntax Highlighting, Linting and Completion
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'

" File explorers
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Writing-related
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'reedes/vim-litecorrect'

" Themes
Plug 'gruvbox-community/gruvbox'

" General Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'

" Tagbar
Plug 'liuchengxu/vista.vim'

" Register Preview
Plug 'junegunn/vim-peekaboo'

" Markdown
Plug 'vim-pandoc/vim-pandoc-syntax'

" Latex
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

" Delimiters
Plug 'jiangmiao/auto-pairs'

" Surrounding text
Plug 'tpope/vim-surround'

" Git and GitHub
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" Automatically resize windows
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" File Scrolling
Plug 'psliwka/vim-smoothie'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Quick Jump
Plug 'easymotion/vim-easymotion'

" Commenting
Plug 'scrooloose/nerdcommenter'

" TimeTracking
Plug 'wakatime/vim-wakatime'

" Undo
Plug 'mbbill/undotree'

call plug#end()

" Extended % matching
runtime macros/matchit.vim

" }}}

" General Settings  {{{

set secure
set modeline
set spelllang=en
set mouse=nv
set nostartofline
set title
set autoread
set clipboard=unnamed
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
set switchbuf=usetab
set shortmess+=c
set backspace=indent,eol,start
set fillchars+=fold:.
syntax on

" Tab completion menu
set wildmenu
set wildmode=full
set wildignore+=.svn,CVS,.git,*.pyc,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*/tmp/*,*.zip,log/**,node_modules/**,target/**,tmp/**,*.rbc

" Undo {{{

set undolevels=1000
set undofile

" END Undo }}}

" Use gtf to jump to files with these extensions
set suffixesadd=.md,.c,.h,.cpp,.py,.tex

set tags=tags

" Don't treat hyphens and underscores like whitespace
set iskeyword+=-
set iskeyword+=_

" Search {{{

set showmatch
set matchtime=0
set incsearch
set hlsearch
set ignorecase
set inccommand=nosplit
set smartcase

" END Search }}}

" Line breaking {{{

set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40
highlight ColorColumn ctermbg=237
set colorcolumn=81,121

" END Line breaking }}}

" Show “invisible” characters
set list
set listchars=tab:▸\ ,trail:·,nbsp:_

" Indentation {{{

set copyindent
set preserveindent
filetype plugin indent on

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" END Indentation }}}

" END General Settings }}}

" Appearance {{{

set termguicolors
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox


" Make vertical splits prettier
set fillchars+=vert:┃
highlight VertSplit guifg=11



" Vim Dev Icons {{{

let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 0

" END Vim Dev Icons }}}

" Vista {{{

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']

" END Vista }}}

" Appearance }}}

" AutoGroups {{{

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

augroup GitCommitFormat
    autocmd!
    " Force the cursor onto a new line after 72 characters
    autocmd FileType gitcommit set textwidth=72
    " Colour the 73rd column so that we don’t type over our limit
    set colorcolumn=+1
    " Also colour the 51st column (for titles)
    autocmd FileType gitcommit set colorcolumn+=51
augroup END

augroup MarkdownConcealing
    autocmd!
    autocmd FileType markdown set conceallevel=0
augroup END

augroup SpellcheckAndWritingTools
    autocmd!
    autocmd FileType markdown setlocal spell | call litecorrect#init()
    autocmd FileType text setlocal spell | call litecorrect#init()
    hi SpellBad cterm=underline ctermfg=red
augroup END

augroup NoPasteAfterLeavingInsertMode
    autocmd!
    au InsertLeave * silent! set nopaste
augroup END

" tbh not sure if this should stay
augroup coc-config
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setlocal formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" END AutoGroups- }}}

" Functions {{{

" Modeline for nasm files
function! AppendASMModeline() abort
let l:modeline = printf("; vim: ft=nasm ts=%d sw=%d tw=%d et :",
        \ &tabstop, &shiftwidth, &textwidth)
  call append(line("$"), l:modeline)
  doautocmd BufRead
endfunction

" Rename current file (mirrors $ mv)
function! RenameFile() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':!trash ' . old_name
    redraw!
  endif
endfunction

function! ToggleNerdTree() abort
    :NERDTreeToggle
    :AirlineRefresh
endfunction

" END Functions }}}

" Remappings {{{

" Set , as leader and - as localleader
let mapleader = ","
let maplocalleader = "-"

" Quickly edit important configs
nnoremap <leader>ev :drop ~/.config/nvim/init.vim<cr>
nnoremap <leader>et :drop ~/.tmux.conf<cr>
nnoremap <leader>ez :drop ~/.zshrc<cr>

" Make : commands easier
nnoremap ; :


" Don't overwrite copy register when deleting with x or X
nnoremap x "_x
nnoremap X "_X

" Read modeline
nnoremap <leader>mr :doautocmd BufRead<Cr>

" Yeet those 'Not an editor command' errors right out the fucking window
" Or, defenestrate, as my Dad would say.
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! Qa qa

" Make U do the opposite of u (redo)
nnoremap U <C-r>

" Make K split the current line at the cursor (the opposite of J)
nnoremap K i<CR><Esc>

" Save one chracter when saving, and only write if there are changes
nnoremap <leader>w :up<CR>

" FZF mappings
" Little hack to make this play nicely with setWorkingDirForCurrentWindow
nnoremap <C-p> :GFiles<CR>
nnoremap <C-p>. :Files ..<CR>
nnoremap <C-p>.. :Files ../..<CR>
nnoremap <leader>b :Buffers<CR>

" Close buffers and windows more easily
nnoremap <leader>q :bdelete<cr>

 " Git Mappings

" Open selection on github
nnoremap go :.Gbrowse<CR>
vnoremap go :'<,'>.Gbrowse<CR>

nnoremap ga :Gwrite<CR>
nnoremap gc :Git commit --verbose<CR>
nnoremap gl :Gpull<CR>
nnoremap gmv :Gmove<CR>
nnoremap gp :Gpush<CR>
nnoremap gs :Gstatus<CR>


" Change word under cursor. Repeatable with . https://youtu.be/7Bx_mLDBtRc?t=130
nnoremap c* *Ncgn

" Quickly tabularize selected block
vnoremap <leader>t :Tabularize / \|<cr>

" Dictionary (definition) lookup
nnoremap <leader>D :Dict<cr>
vnoremap <leader>D :Dict<cr>

" Distraction Free Mode
nnoremap <silent> <leader>z :Goyo<cr>


" Traverse buffer list more easily.
"nnoremap <leader>h :bprevious<CR>
nnoremap < :bprevious<CR>
nnoremap > :bnext<CR>

" Easily move between panes
nnoremap <silent> sh <C-w>h
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l


" Easily Create panes
nnoremap <silent> ss <C-w>s
nnoremap <silent> sv <C-w>v


" Jump to anywhere on screen with minimal keystrokes `s{char}{char}{label}`
nmap m <Plug>(easymotion-overwin-f2)

" Toggle spell check
nnoremap <leader>te :tabnew<CR>

" Toggle file browser, undotree and Vista tagbar
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <C-n> :call ToggleNerdTree()<CR>
nnoremap <Leader>v :Vista!!<CR>

" Turn off search highlighting
nnoremap <Leader>/ :noh<CR>

" Remappings }}}

" Writing {{{

" Note that this dictionary is purely for spelling correction and does not
" allow you to look up definitions. That's why I have the vim-dict plugin.
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.vim/thesaurus/mthesaur.txt

" END Writing }}}

" coc.nvim {{{
" Heavily based on: https://github.com/neoclide/coc.nvim#example-vim-configuration

" https://github.com/neoclide/coc.nvim/issues/856
let g:coc_node_path = "/bin/node"

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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

" END coc.nvim }}}

" Markdown {{{

" Pandoc {{{

" vim-pandoc {{{

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

" END vim-pandoc }}}

" vim-pandoc-syntax {{{

let g:pandoc#syntax#conceal#urls = 0
let g:pandoc#syntax#conceal#blacklist = [ "codeblock_start", "codeblock_delim", "image", "block" ]
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#codeblocks#embeds#langs = [ "python", "ruby", "c", "bash=sh" ]

" END vim-pandoc-syntax }}}

" END pandoc }}}

" END Markdown }}}

" Latex {{{
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Vimtex }}}
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
" END Vimtex }}}

" Tex-conceal }}}
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none
" END Tex-conceal   }}}


" END Latex }}}

" fzf {{{

" https://github.com/neovim/neovim/issues/9718#issuecomment-546603628
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" END fzf }}}

" Undotree {{{

let g:undotree_SetFocusWhenToggle = 1

" END Undotree }}}

" NERDTree {{{

let NERDTreeShowHidden = 1
let NERDTreeStatusline = 0

" END NERDTree }}}

" vim-easymotion {{{

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" END vim-easymotion }}}

" Better Whitespace {{{
"
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_skip_empty_lines=1
let g:show_spaces_that_precede_tabs=1

" END Better Whitespace }}}

" vim-airline {{{

let g:airline_theme='onedark'
" let g:airline_theme='gruvbox_material'
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" END Airline }}}

" NerdCommenter {{{

" Add spaces after comment delimiters
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Trim trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NerdCommenter }}}

" Python {{{

let python_highlight_all=1
let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'


" END Python }}}

" Gist {{{

let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'

" END Gist }}}