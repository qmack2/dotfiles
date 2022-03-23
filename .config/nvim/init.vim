" LOAD PLUGINS
call plug#begin('$HOME/.local/share/nvim')
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
" I strongly advice that you do _not_ use vim-polyglot!
"Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'jiangmiao/auto-pairs'

"File search and navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Editor interface and theming
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'arcticicestudio/nord-vim'

"Debugging, refactoring and version control
Plug 'puremourning/vimspector'

Plug 'lervag/vimtex'

Plug 'sirver/ultisnips'
call plug#end()

" SET OPTIONS
set conceallevel=0
set noshowmode
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

set showcmd

set ttyfast
set matchpairs+=<:>

set number

set termguicolors
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" SET COLORSCHEME
colorscheme nord
set bg=dark
" Custom highlighting should be put behind the colorscheme autocmd
autocmd ColorScheme * highlight Conceal ctermbg=none

" CUSTOM MAPPINGS
inoremap jk <Esc>

" CONFIGURE PLUGINS
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0

let g:coc_global_extensions = [ 'coc-tsserver' ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" spellcheck
setlocal spell
set spelllang=en_ca
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
