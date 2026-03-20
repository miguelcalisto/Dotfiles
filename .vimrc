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
set cursorline

highlight CursorLine ctermbg=darkgray guibg=blue
highlight CursorLine guibg=pink guifg=red

call plug#begin('~/.vim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

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

vnoremap y "+y

nnoremap Y "+yy

nnoremap p "+p
vnoremap p "+p


set showmode
set showcmd
set laststatus=2
set ruler



"nnoremap y "+y
"vnoremap y "+y
"nnoremap yy "+yy

"nnoremap p "+p
"vnoremap p "+p

