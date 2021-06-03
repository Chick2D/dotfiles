" ====================================================================
" 		    	   NVim Configuration				
" ====================================================================

" Neovim Vim-Plug Block:
call plug#begin('~/local/share/nvim/plugged')


Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'aserebryakov/vim-todo-lists'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'

call plug#end()

let g:Hexokinase_highlighters = [ ' background ' ]
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
syntax enable				" Enables syntax highlighting
colorscheme gruvbox			" Colorscheme
set cmdheight=1				" Gives more space for coc to display messages 
set encoding=utf-8			" Set internal encoding of vim
set scrolloff=7				" Show 7 lines around the cursorline
set relativenumber			" Enable line numbers
set number
set hidden  				" allow buffer switching without saving
set showtabline =2			" Show tabline always
set guicursor=				" Status bar shows mode; cursor doesn't need to
set clipboard+=unnamedplus		" Enable copy to system clipboard
set mouse=a				" Enable using the mouse
set termguicolors			" Enable colors
set cursorline
set noshowmode
nnoremap  :tabnext
nnoremap  :tabprevious
