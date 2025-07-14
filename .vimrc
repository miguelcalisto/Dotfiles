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

" Plugin manager (Vim-Plug) - início único
call plug#begin('~/.vim/plugged')

" Tema Catppuccin
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Plugin que mostra as cores no código
Plug 'ap/vim-css-color'

call plug#end()

" Ativa syntax highlighting e arquivos
syntax enable
filetype plugin on

" Cores e tema
set termguicolors
colorscheme catppuccin_mocha

let g:lightline = {'colorscheme': 'catppuccin_mocha'}
set noshowmode
let g:airline_theme = 'catppuccin_mocha'

" Fundo transparente
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
highlight CursorLineNr guifg=#facc15 guibg=NONE gui=bold

" Números das linhas em azul
highlight LineNr ctermfg=Blue guifg=#e5c890

" Copiar usando y no modo visual
vnoremap y "+y

" Copiar linha inteira no modo normal usando Y (shift + y)
nnoremap Y "+yy

" Colar usando p no modo normal e visual
nnoremap p "+p
vnoremap p "+p


set showmode
set showcmd
set laststatus=2
set ruler



"cado de errado o clickboard
" Copiar sempre para o clipboard do sistema
"nnoremap y "+y
"vnoremap y "+y
"nnoremap yy "+yy

" Colar sempre do clipboard do sistema
"nnoremap p "+p
"vnoremap p "+p

