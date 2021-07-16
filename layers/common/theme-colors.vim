Plug 'zhenyangze/eleline.vim'
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'gcmt/taboo.vim'
Plug 'zhenyangze/vim-material'
Plug 'https://gitee.com/zhenyangze/onehalf', {'rtp': 'vim/'}
Plug 'arcticicestudio/nord-vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'rakr/vim-two-firewatch'
if has('mac')
    Plug 'ryanoasis/vim-devicons'
    if !has('nvim')
        set guifont=DroidSansMono_Nerd_Font:h12
    end
endif

" indentLine  "{{{ 缩进格式
    let g:indentLine_color_term = 239
    let g:indentLine_char = '¦'
    "let g:indentLine_char = '┆'
    set list lcs=tab:\¦\ 
    "let g:indentLine_fileTypeExclude = ['fern']
"}}}
" taboo.vim {{{
let g:taboo_tab_format = " %m[%N] %f "
" }}}

let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1