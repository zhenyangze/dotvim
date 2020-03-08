syntax enable

"let g:space_vim_dark_background = 234
"autocmd ColorScheme janah highlight Normal ctermbg=235
"colorscheme space-vim-dark
"set background=dark
"colorscheme gruvbox
"colorscheme onedark
"color dracula
" colorscheme molokai
" colorscheme spacegray
" colorscheme onedark
" colorscheme space-vim-dark
if !exists('$TMUX')
    set termguicolors
    set background=dark
    let g:material_style='palenight'
    let g:airline_theme='onedark'
    colorscheme spacemacs-theme
    "colorscheme onehalfdark
    "colorscheme vim-material
else
    set background=dark 
    colorscheme gruvbox
endif

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

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
" set laststatus=2 " 增强vim下方状态栏显示

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
