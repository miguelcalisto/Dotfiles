set number
set autoindent
set smartindent
set ruler
set cursorline
set incsearch
set hlsearch
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab

" Plugin manager (Vim-Plug)
call plug#begin('~/.vim/plugged')

" Tema Catppuccin
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'kshenoy/vim-signature'
Plug 'ap/vim-css-color'

call plug#end()

syntax enable
filetype plugin on

set termguicolors
colorscheme catppuccin_mocha

let g:lightline = {'colorscheme': 'catppuccin_mocha'}
set noshowmode
let g:airline_theme = 'catppuccin_mocha'

hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
highlight CursorLineNr guifg=#facc15 guibg=NONE gui=bold
highlight LineNr ctermfg=Blue guifg=#e5c890
highlight SignatureMarkText guifg=#f2cdcd gui=bold
highlight StatusLineFile ctermfg=Yellow ctermbg=DarkBlue guifg=#facc15 guibg=#1e1e2e gui=bold

set statusline=%#StatusLineFile#%F\ %m
set showmode
set showcmd
set laststatus=2

vnoremap y "+y
nnoremap Y "+yy
nnoremap p "+p
vnoremap p "+p

