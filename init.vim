" This is @ewpratten's NeoVim config file.
"
" TODOS:
" - RustFmt
" - Syntax highlighting
" - Minimalist theme
set encoding=utf-8

" Nice features
filetype plugin on
syntax enable
set hidden
set nobackup
set nowritebackup
let mapleader = ";"
set cmdheight=1
set updatetime=300
set shortmess+=c
set mouse+=a
set termguicolors

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

" Initialize plugin system
call plug#end()

" Set up the tab buffer
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true

" Theme configuration
let g:vscode_style = "dark"
colorscheme vscode

" Setup calls
lua require'nvim-tree'.setup { auto_close = true }
lua require("range-highlight").setup()
lua require('staline').setup{mode_icons={n='NRM',i='INS',c='CNG',v='VIS'}, sections={left={'>','mode','|','file_name',' ','branch'}, mid={'lsp'}, right={'line_column','<'}}, defaults={line_column=" Ln %l, Col %c"}}

"---- Keybindings ----"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <C-b> :NvimTreeToggle<CR>
"nmap <Leader>i <Esc><Plug>(ale_fix)
