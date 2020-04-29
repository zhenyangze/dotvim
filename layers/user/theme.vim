syntax enable

" color dracula
" colorscheme molokai
" colorscheme spacegray
" colorscheme onedark
" colorscheme space-vim-dark
if !exists('$TMUX')
    colorscheme space_vim_theme
    set termguicolors
    set background=dark
    let g:material_style='palenight'
    "colorscheme onehalfdark
    "colorscheme vim-material
    "hi Normal     ctermbg=NONE guibg=NONE
    "hi LineNr     ctermbg=NONE guibg=NONE
    "hi SignColumn ctermbg=NONE guibg=NONE
    hi LineNr ctermbg=NONE guibg=NONE
    hi Comment guifg=#5C6370 ctermfg=59
else
    set background=dark 
    colorscheme onehalfdark
endif

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
