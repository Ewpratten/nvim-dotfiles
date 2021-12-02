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
set guifont=Hack:h10
set cursorline

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
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'luukvbaal/stabilize.nvim'

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
let g:neovide_fullscreen=v:false
let neovide_remember_window_size = v:true
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_trail_length=0.1
highlight CursorLine guibg=#373737
let g:gitblame_highlight_group = "CursorLine"
let g:gitblame_date_format = '%r'
let g:gitblame_message_template = '<author> - <date> - <summary>'
let g:gitblame_enabled = 0

" Setup calls
lua require'nvim-tree'.setup { auto_close = true }
lua require("range-highlight").setup()
lua require("plugin_setup/staline")
lua require('neoscroll').setup()
lua require("stabilize").setup()

" Auto-Format settings
let g:rustfmt_autosave = 1

" Disable the arrow keys to make the vim purists happy
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Allow CTRL-Jump functionality I live off of
noremap <C-l> e
noremap <C-h> b

" Enable VSCode-style Tab and Shift-Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"---- Keybindings ----"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <C-b> :NvimTreeToggle<CR>
"nmap <Leader>i <Esc><Plug>(ale_fix)
map <silent> <leader>w :lua require('nvim-window').pick()<CR>
nmap <silent> <leader>d :call CocAction('jumpDefinition', 'tabe')<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>