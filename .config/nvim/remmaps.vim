" Remappings

nnoremap ; :

" nmap <leader>e !!
nnoremap sc :%! 

" Scroll
map e <C-u>
map r <C-d>

" Switch tab
nmap tn :tabedit<Return>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" File tree
" add dfx

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

nnoremap <silent> <c-Up> :resize +3<CR>
nnoremap <silent> <c-Down> :resize -3<CR>
nnoremap <silent> <c-left> :vertical resize -3<CR>
nnoremap <silent> <c-right> :vertical resize +3<CR>
