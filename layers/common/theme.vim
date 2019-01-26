Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim'
Plug 'gcmt/taboo.vim'
Plug 'zhenyangze/vim-material'
if has('mac')
    Plug 'ryanoasis/vim-devicons'
    set guifont=DroidSansMono_Nerd_Font:h12
endif

" indentLine  "{{{ 缩进格式
    let g:indentLine_color_term = 239
    let g:indentLine_char = '¦'
    "let g:indentLine_char = '┆'
     set list lcs=tab:\¦\ 
"}}}
" taboo.vim {{{
let g:taboo_tab_format = " %m[%N] %f "
" }}}