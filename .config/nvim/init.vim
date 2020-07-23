" Plugins
" -------------------------------------------------------------------------------------------------

"Directory for the plugins.
call plug#begin('~/.vim/plugged')

" Completion server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Gruvbox theme.
Plug 'gruvbox-community/gruvbox'

" fuzzy find files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigate and manipulate files in a tree view.
Plug 'preservim/nerdtree'

" Helpers for moving and manipulating files / directories.
Plug 'tpope/vim-eunuch'

" Show github add/delete in the margin
Plug 'airblade/vim-gitgutter'

" Nice starting screen when just typing <vim>
Plug 'mhinz/vim-startify'

" Syntax Helper
Plug 'sheerun/vim-polyglot'

" undo tree
Plug 'mbbill/undotree'

"Comment code with ++ in normal/visual mode
Plug 'preservim/nerdcommenter'

" Outline for files
Plug 'majutsushi/tagbar'

call plug#end()

" -------------------------------------------------------------------------------------------------
" My Sets 
" -------------------------------------------------------------------------------------------------

set backspace=indent,eol,start
set backupdir="~/.config/nvim/backup//"
set cindent
set colorcolumn=100
set incsearch
set ignorecase
set noswapfile
set signcolumn=yes
set shortmess+=c
set tw=100
" For UndoTree
set undofile
set undodir="~/.config/nvim/undodir//"

set hidden                              " Required to keep multiple buffers open multiple buffers
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `"` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set showtabline=1                       " Always show tabs
"set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else`"`
 "To wrap lines
set whichwrap+=<,>,h,l,[,]

" -------------------------------------------------------------------------------------------------
" My Mappings
" -------------------------------------------------------------------------------------------------

"Ctrl-C to ESCAPE
imap <C-c> <Esc>
" Ctrl-C -> Remove highlights when searching
map <C-c> :noh<return><esc>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" To save Ctrl-S exits out of insert mode
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" -------------------------------------------------------------------------------------------------
" Gruvbox Theme
" -------------------------------------------------------------------------------------------------

" Set the color scheme
colorscheme gruvbox

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
set t_Co=256

let g:gruvbox_contrast_light='hard'

"This needs to come last, otherwise the colors aren't correct.
syntax on

" -------------------------------------------------------------------------------------------------
" Commenter
" -------------------------------------------------------------------------------------------------
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" -------------------------------------------------------------------------------------------------
" NerdTree
" -------------------------------------------------------------------------------------------------

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$', '^node_modules$']

" -------------------------------------------------------------------------------------------------
" FZF
" -------------------------------------------------------------------------------------------------

"fzf map. Show Git Files, All Files
map <C-p> :Files<CR>
map <C-g> :GFiles<CR>

" -------------------------------------------------------------------------------------------------
" undotree
" -------------------------------------------------------------------------------------------------

" toggle undotree
nnoremap <C-u> :UndotreeToggle<CR>

" -------------------------------------------------------------------------------------------------
" Tagbar
" -------------------------------------------------------------------------------------------------

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>


" -------------------------------------------------------------------------------------------------
" COC
" -------------------------------------------------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)>

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-D for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add spacing between pairs
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Prettier on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
