" Set leader
let mapleader = ";"

"------------------------------------------------------------------------
"Plugins
"------------------------------------------------------------------------

"Directory for the plugins.
call plug#begin('~/.vim/plugged')

" Gruvbox theme.
Plug 'gruvbox-community/gruvbox'

"Integrate fzf with vim. For file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigate and manipulate files in a tree view.
Plug 'preservim/nerdtree'

" Helpers for moving and manipulating files / directories.
Plug 'tpope/vim-eunuch'

" Show github add/delete in the margin
Plug 'airblade/vim-gitgutter'

" Github Integration with VIM
Plug 'tpope/vim-fugitive'

" Nice starting screen when just typing <vim>
Plug 'mhinz/vim-startify'

" Syntax Helper
Plug 'sheerun/vim-polyglot'

" undo tree
Plug 'mbbill/undotree'

"Lightline for better statusline/tablines
Plug 'itchyny/lightline.vim'

" Completion server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets for languages - Required
" Plug 'honza/vim-snippets' 

" Comment stuff out easily with <gcc>
Plug 'tpope/vim-commentary'

" Outline for files
" Plug 'majutsushi/tagbar'

" Allows for cursor to stay in position and folds to stay
" Plug 'tweekmonster/gofmt.vim'
call plug#end()


"------------------------------------------------------------------------------

" Toggle the outline tagbar
nmap <F8> :TagbarToggle<CR>

"undo tree show
nnoremap <c-u> :UndotreeShow<CR>

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


noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

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
set t_Co=256

" Gruvbox has a 'hard', 'medium' (default) and 'soft' contrast options.
let g:gruvbox_contrast_light='hard'
let g:NERDTreeIgnore = ['^node_modulues$', '.git$']

"This needs to come last, otherwise the colors aren't correct.
syntax on

"-------------------------------------------------------------------------------
"Basic Settings
"-------------------------------------------------------------------------------
set autoindent
set backspace=indent,eol,start
set backupdir="~/.config/nvim/backup//"
" Give more space for displaying messages.
set cindent
set cmdheight=2
set colorcolumn=100
set cursorline
" set directory="~/.config/nvim/swap//"
" use space instead of tab
set expandtab
" TextEdit might fail if hidden is not set.
set hidden
set incsearch
set laststatus=2
" Allow scrolling (just in case :))
set mouse=a
set number
set nobackup
set nowritebackup
set noshowmode
set noswapfile
" number of space char inserted for indentation
set shiftwidth=2
set signcolumn=yes
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set smarttab
set splitbelow splitright
set tabstop=2
set tw=100
"default updatetime 4000ms is not good for async update
set updatetime=50
set undofile
set undodir="~/.config/nvim/undodir//"

" Share the VIM clipboard with the X11 clipboard
" if has("clipboard")
"   set clipboard=unnamed " copy to the system clipboard
     
"   if has("unnamedplus") " X11 support
"     set clipboard+=unnamedplus
"   endif
" endif

set whichwrap+=<,>,h,l,[,]

"Cursor stuff
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"--------------------------------------------------------------------------------
"COC
"--------------------------------------------------------------------------------

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)>

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add spacing between pairs
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"------------------------------------------------------------------------------
"Commands
"------------------------------------------------------------------------------
"Extra
let g:NERDTreeHighlightCursorline = '0' "makes NerdTree faster"
let g:AutoPairsFlyMode='1' "Auto pairs correction"

"coc
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ ]

" Remap for rename current word

" Remape Tagbar show prototype to o (default is space, but it fuck up SPACE + number)
let g:tagbar_map_showproto = "o"

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" --- vim go (polyglot) settings.
 let g:go_highlight_build_constraints = 1
 let g:go_highlight_extra_types = 1
 let g:go_highlight_fields = 1
 let g:go_highlight_functions = 1
 let g:go_highlight_methods = 1
 let g:go_highlight_operators = 1
 let g:go_highlight_structs = 1
 let g:go_highlight_types = 1
 let g:go_highlight_function_parameters = 1
 let g:go_highlight_function_calls = 1
 let g:go_highlight_generate_tags = 1
 let g:go_highlight_format_strings = 1
 let g:go_highlight_variable_declarations = 1
 let g:go_auto_sameids = 1
