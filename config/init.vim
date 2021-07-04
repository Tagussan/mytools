call plug#begin()
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
Plug 'hoob3rt/lualine.nvim'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/matchit.zip'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-syntax-extra'
Plug 'alvan/vim-closetag'
Plug 'osyo-manga/vim-brightest'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-sleuth'
Plug 'dense-analysis/ale'
"Plug 'airblade/vim-gitgutter'
Plug 'simeji/winresizer'
Plug 'svermeulen/vim-easyclip'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'
"Plug 'maxboisvert/vim-simple-complete'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'haorenW1025/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSInstall c cpp python bash dockerfile css html javascript latex regex yaml julia'}
Plug 'nvim-treesitter/completion-treesitter'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

set noshowmode

colorscheme hybrid
"set background=dark

"share clipboard
" set clipboard=unnamed,unnamedplus
syntax on

set autoindent
set smartindent
set backspace=indent,eol,start
set showmatch
set matchtime=1
set hlsearch
set matchpairs& matchpairs+=<:>
set number
"set shiftwidth=4
set smarttab
set ignorecase
set expandtab
set softtabstop=0
set cursorline
set noswapfile
set noshowmode
set tags=.tags
set laststatus=2
set undofile
set undodir=~/.config/nvim/undodir
set fileformat=unix

" keymaps
nnoremap j gj
nnoremap k gk
nnoremap p ]p
nnoremap <Down> gj
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap <C-e> $
nnoremap <C-a> ^
vnoremap <C-e> $
vnoremap <C-a> ^
nnoremap <Esc><Esc> :nohlsearch<CR>

" indent guide
let g:indent_guides_enable_on_vim_startup = 1

lua<<EOF
require('lualine').setup()
require('gitsigns').setup{
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '*', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  }
}
EOF

" UndoTree
nnoremap <C-r> :UndotreeToggle<CR>

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"improve asterisk
nnoremap <silent> * "syiw<Esc>: let @/ = @s<CR>:set hls<CR>

"easymotion
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap s <Plug>(easymotion-bd-w)
vmap s <Plug>(easymotion-bd-w)

"**************************
" Rainbow paren and keyword highlight
"**************************
lua <<EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}
EOF

let g:brightest#highlight = {
\   "group" : "BrightestUnderline"
\}
let g:brightest#enable_filetypes = {
\	"tex" : 0
\}

au FileType ruby     let b:AutoPairs = AutoPairsDefine({'begin': 'end//n]'})
au FileType systemverilog     let b:AutoPairs = AutoPairsDefine({'begin': 'end//n]'})

" let g:ale_verilog_verilator_options = '-I ./'
au FileType systemverilog
    \ let g:ale_linters = {'systemverilog' : ['verilator'],}

hi Normal guibg=NONE ctermbg=NONE
let g:winresizer_start_key = '<C-S>'

let g:EasyClipShareYanks = 1

let g:cursorhold_updatetime = 100

"**************************
" VimTex
"**************************
let g:tex_flavor='latex'
"let g:vimtex_view_enabled = 1
let g:tex_conceal=""
let g:vimtex_latexmk_options = '-latex=pdflatex --shell-escape'
"let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_fold_enabled=0
let g:tex_fast = "bMpr"
autocmd BufNewFile,BufRead *.tex set spell
set spelllang=en,cjk

"**************************
" Completion settings
"**************************
let g:vsc_type_complete_length = 1

nmap <silent> <C-g> :History<CR>

" Configure the completion chains
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['ts', 'buffers']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\}

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_sorting = "length"
let g:completion_matching_smart_case = 1

"**************************
" Filer
"**************************
nnoremap <C-f> :NvimTreeToggle<CR>

lua <<EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
vim.g.nvim_tree_bindings = {
  { key = {"<CR>", "l"}, cb = tree_cb("edit") },
  { key = "s",             cb = tree_cb("vsplit") },
  { key = "t",             cb = tree_cb("tabnew") },
  { key = "h",             cb = tree_cb("close_node") },
  { key = "r",             cb = tree_cb("refresh") },
  { key = "q",             cb = tree_cb("close") }
}
EOF