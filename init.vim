" This is @ewpratten's NeoVim config file.
"
" TODOS:
" - RustFmt
" - Syntax highlighting
" - Minimalist them
" - TabLine: https://github.com/romgrk/barbar.nvim
set encoding=utf-8

" Nice features
filetype plugin on
syntax enable
set hidden
set nobackup
set nowritebackup
let mapleader = ";"
set cmdheight=2
set updatetime=300
set shortmess+=c
set mouse=a

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

" Initialize plugin system
call plug#end()

"---- Keybindings ----"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"nmap <Leader>i <Esc><Plug>(ale_fix)
