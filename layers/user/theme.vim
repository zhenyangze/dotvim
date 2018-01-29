syntax enable

"let g:space_vim_dark_background = 234
"autocmd ColorScheme janah highlight Normal ctermbg=235
"colorscheme space-vim-dark
"set background=dark
"colorscheme gruvbox
colorscheme onedark
if !exists('$TMUX')
    set termguicolors
endif

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
