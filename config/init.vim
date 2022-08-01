call plug#begin()
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
Plug 'w0ng/vim-hybrid'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'Yggdroot/indentLine'
Plug 'hoob3rt/lualine.nvim'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/matchit.zip'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'
Plug 'osyo-manga/vim-brightest'
Plug 'tpope/vim-sleuth'
Plug 'dense-analysis/ale'
Plug 'simeji/winresizer'
Plug 'svermeulen/vim-easyclip'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'PHSix/nvim-hybrid'
call plug#end()

set noshowmode

set termguicolors
"set background=dark

" configure nvcode-color-schemes
let g:nvcode_termcolors=256
syntax on
colorscheme hybrid
"colorscheme nvim-hybrid

"share clipboard
" set clipboard=unnamed,unnamedplus

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

" global copy
vnoremap <C-c> :w! ~/.vimbuffer<CR>
nnoremap <C-c> :.w! ~/.vimbuffer<CR>
" global paste
noremap <C-p> :r ~/.vimbuffer<CR>

" indent guide
let g:indent_guides_enable_on_vim_startup = 1

"**************************
" treesitter
"**************************
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

"**************************
" line and git signs
"**************************
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
"let g:tex_flavor='latex'
""let g:vimtex_view_enabled = 1
"let g:tex_conceal=""
"let g:vimtex_latexmk_options = '-latex=pdflatex --shell-escape'
""let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_fold_enabled=0
"let g:tex_fast = "bMpr"
"autocmd BufNewFile,BufRead *.tex set spell
"set spelllang=en,cjk

"**************************
" Completion settings
" Minimum autocompletion from https://gist.github.com/vheon/10104517
"**************************

set cot=menu,menuone

ino <BS> <BS><C-r>=getline('.')[col('.')-3:col('.')-2]=~#'\k\k'?!pumvisible()?"\<lt>C-n>\<lt>C-p>":'':pumvisible()?"\<lt>C-y>":''<CR>
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : ""
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:skinny_insert(char)
  if !pumvisible() && !exists('s:skinny_complete') &&
              \ getline('.')[col('.') - 2].a:char =~# '\k\k'
    let s:skinny_complete = 1
    noautocmd call feedkeys("\<C-n>\<C-p>", "nt")
  endif
endfunction

augroup SkinnyAutoComplete
  autocmd!
  autocmd InsertCharPre * call <SID>skinny_insert(v:char)
  autocmd CompleteDone * if exists('s:skinny_complete') | unlet s:skinny_complete | endif
augroup END

"**************************
" Filer
"**************************
lua <<EOF
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
	{ key = {"<CR>", "l"}, action = "edit" },
	{ key = "s",             action = "vsplit" },
	{ key = "t",             action = "tabnew" },
	{ key = "h",             action = "close_node" },
	{ key = "r",             action = "refresh" },
	{ key = "q",             action = "close" }
      },
    },
  },
  renderer = {
    group_empty = true,
  },
})
EOF
nnoremap <C-f> :NvimTreeToggle<CR>
