" LOAD PLUGINS
call plug#begin('$HOME/.local/share/nvim')
Plug 'jiangmiao/auto-pairs'

"File search and navigation
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Editor interface and theming
Plug 'navarasu/onedark.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'NTBBloodbath/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'

"Debugging, refactoring and version control
Plug 'puremourning/vimspector'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

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
set signcolumn=yes

set showcmd

set ttyfast
set matchpairs+=<:>

set number

set termguicolors
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"let g:lightline = {
"\ 'colorscheme': 'onedarkdeep',
"\ }

lua require("galaxyline.themes.onedarkdeep")
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
let g:onedark_config = {
    \ 'style': 'deep',
\}
colorscheme onedark

lua require 'colorizer'.setup()

"set bg=dark
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

let g:dashboard_default_executive = 'telescope'
let g:mapleader="\<Space>"
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

lua << end
require('lspconfig').texlab.setup{}
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } for type, icon in pairs(signs) do local hl = "DiagnosticSign" .. type vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl }) end
end
" spellcheck
setlocal spell spelllang=en_ca
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
