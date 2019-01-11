syntax enable

"let g:space_vim_dark_background = 234
"autocmd ColorScheme janah highlight Normal ctermbg=235
"colorscheme space-vim-dark
"set background=dark
"colorscheme gruvbox
"colorscheme onedark
if !exists('$TMUX')
    set termguicolors
endif
colorscheme vim-material
let g:material_style='palenight'
set background=dark
let g:airline_theme='onedark'
hi comment guifg=#676E95

" vim-airline-themes"{{{theme
if !exists("g:airline_theme")
    let g:airline_theme="onedark" ":AirlineTheme {theme-name} Displays or changes the current theme.
endif
"这个是安装字体后 必须设置此项" 
"let g:airline_powerline_fonts = 1   
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



"color dracula
" colorscheme molokai
" colorscheme spacegray
" colorscheme onedark
" colorscheme space-vim-dark

"autocmd VimEnter *
            "\   if !argc()
            "\ |   Startify
            "\ |   NERDTreeToggle
            "\ |   wincmd w
"            \ | endif

"let g:startify_custom_header = [
            "\ '    _______                 __     __                       ',
            "\ '   |___  / |                \ \   / /                       ',
            "\ '      / /| |__   ___ _ __    \ \_/ /_ _ _ __   __ _ _______ ',
            "\ '     / / | |_ \ / _ \  _ \    \   / _  |  _ \ / _  |_  / _ \',
            "\ '    / /__| | | |  __/ | | |    | | (_| | | | | (_| |/ /  __/',
            "\ '   /_____|_| |_|\___|_| |_|    |_|\__,_|_| |_|\__, /___\___|',
            "\ '                                               __/ |        ',
            "\ '                                              |___/         ',
            "\ ]
let g:startify_custom_header = []
