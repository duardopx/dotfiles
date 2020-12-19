call plug#begin('~/.local/share/nvim/plugged')
" Sintax hightlight
Plug 'sheerun/vim-polyglot'

" Linting and Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" File fuzzing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Icons
Plug 'ryanoasis/vim-devicons'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Theme
Plug 'ayu-theme/ayu-vim'

" Status line
 Plug 'itchyny/lightline.vim'

" Scroll
Plug 'psliwka/vim-smoothie'

" File filter
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

" Scroll
Plug 'psliwka/vim-smoothie'

" Quick Jump
Plug 'easymotion/vim-easymotion'

" Commenting
Plug 'preservim/nerdcommenter'

" Time Tracking
Plug 'wakatime/vim-wakatime'

" Surroud
Plug 'machakann/vim-sandwich'

" Undo
Plug 'mbbill/undotree'

" Latex
Plug 'lervag/vimtex'

" Buffer navegation
Plug 'jlanzarotta/bufexplorer'

" Improve sintaxe in markdown and latex
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()
