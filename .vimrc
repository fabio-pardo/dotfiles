" Set leader
let mapleader = ";"

"Plugins
"------------------------------------------------------------------------

"Directory for the plugins.
call plug#begin('~/.vim/plugged')

"Atom One Dark Theme.
Plug 'joshdick/onedark.vim'

" Gruvbox theme.
Plug 'gruvbox-community/gruvbox'

"Integrate fzf with vim.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigate and manipulate files in a tree view.
Plug 'preservim/nerdtree'

" Helpers for moving and manipulating files / directories.
Plug 'tpope/vim-eunuch'

"show git file changes in the gutter.
if has('nvim') || has('patch-8.0.902')
	Plug 'mhinz/vim-signify'
else
	Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" undo tree
Plug 'mbbill/undotree'

"Lightline for better statusline/tablines
Plug 'itchyny/lightline.vim'

" Helpers for moving and manipulating files / directories.
Plug 'tpope/vim-eunuch'

"Java Completion 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autopairs
Plug 'jiangmiao/auto-pairs'



call plug#end()


"------------------------------------------------------------------------------

"undo tree show
nnoremap <c-u> :UndotreeShow<CR>

"signify gutter
"default updatetime 4000ms is not good for async update
set updatetime=40

"fzf map
map <c-p> :Files<CR>
map <c-g> :GFiles<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"NerdTree Map
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  
  set termguicolors
endif


" Set the color scheme.
colorscheme gruvbox 

" Set the color scheme to dark.
set background=dark

" Gruvbox has a 'hard', 'medium' (default) and 'soft' contrast options.
let g:gruvbox_contrast_light='hard'

"This needs to come last, otherwise the colors aren't correct.
syntax on

"-------------------------------------------------------------------------------
"Basic Settings
"-------------------------------------------------------------------------------

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set cmdheight=2
set cryptmethod=blowfish2
set cursorline
set encoding=utf-8
set expandtab smarttab
set formatoptions=tcqrn1
set guicursor=
set hlsearch
set hidden
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
set modelines=2
set mouse=a
set nocompatible
set noerrorbells 
set noshiftround
set nospell
set nostartofline
set noshowmatch
set nohlsearch
set nowrap
set noswapfile
set nobackup
set nu
set number relativenumber
set regexpengine=1
set relativenumber
set ruler
set scrolloff=8
set showcmd
set showmatch
set shortmess+=c
set showmode
set showtabline=2
set shiftwidth=4
set smartcase
set smartindent
set softtabstop=4
set spelllang=en_us
set splitbelow
set splitright
set tabstop=4
set termguicolors
set textwidth=0
set ttimeout
set ttyfast
set ttymouse=sgr
set undodir=~/.vim/undodir
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap

"--------------------------------------------------------------------------------
" Lightline
"--------------------------------------------------------------------------------
