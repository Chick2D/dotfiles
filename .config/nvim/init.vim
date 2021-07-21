" ====================================================================
" 		    	   NVim Configuration				
" ====================================================================

" Neovim Vim-Plug Block:
call plug#begin('/home/chick/.config/nvim/vimplug')


Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'aserebryakov/vim-todo-lists'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Iron-E/nvim-highlite'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'dawikur/base16-vim-airline-themes/'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

call plug#end()

"source $HOME/.config/nvim/colorschemes/tommorowdark.vim
let g:neovide_cursor_animation_length=0.03
let g:Hexokinase_highlighters = [ ' background ' ]
let g:solarized_termcolors=256
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
syntax enable				" Enables syntax highlighting
set guifont="FiraCode Nead Font Regular:h15"
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
colorscheme gruvbox
"nmap <Leader>l <Plug>(Limelight)
"xmap <Leader>l <Plug>(Limelight)

"nnoremap  :tabnext
"nnoremap  :tabprevious
