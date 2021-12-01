" This is @ewpratten's NeoVim config file.
set encoding=utf-8

" Nice features
filetype plugin on
syntax enable
filetype plugin indent on
set hidden
set nobackup
set nowritebackup
let mapleader = ";"
set cmdheight=1
set updatetime=300
set shortmess+=c
set mouse+=a
set termguicolors
set number

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Enable vim-plug
call plug#begin('~/.vim/plugged')

"" Install simple plugins ""
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'winston0410/range-highlight.nvim'
Plug 'winston0410/cmd-parser.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'jghauser/mkdir.nvim'
Plug 'tamton-aquib/staline.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-fugitive'
Plug 'f-person/git-blame.nvim'
Plug 'karb94/neoscroll.nvim'

" Initialize plugin system
call plug#end()

" Set up the tab buffer
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true

" Theme configuration
let g:vscode_style = "dark"
colorscheme vscode

" Misc settings
let g:rust_clip_command = 'xclip -selection clipboard'

" Setup calls
lua require'nvim-tree'.setup { auto_close = true }
lua require("range-highlight").setup()
lua require("plugin_setup/staline")
lua require('neoscroll').setup()

" Auto-Format settings
let g:rustfmt_autosave = 1

"---- Keybindings ----"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <C-b> :NvimTreeToggle<CR>
"nmap <Leader>i <Esc><Plug>(ale_fix)