Plug 'guns/xterm-color-table.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'
Plug 'Yggdroot/indentLine'

Plug 'ajh17/spacegray.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'mhinz/vim-janah'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'

" vim-airline-themes"{{{theme
if !exists("g:airline_theme")
    let g:airline_theme="powerlineish" ":AirlineTheme {theme-name} Displays or changes the current theme.
    "这个是安装字体后 必须设置此项" 
    let g:airline_powerline_fonts = 1   
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'
    "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    " set laststatus=2 " 增强vim下方状态栏显示
endif

" indentLine  "{{{ 缩进格式
    let g:indentLine_color_term = 239
    let g:indentLine_char = '¦'
    "let g:indentLine_char = '┆'
    " set list lcs=tab:\|\
"}}}