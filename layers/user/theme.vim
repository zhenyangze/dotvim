syntax enable

" color dracula
" colorscheme molokai
" colorscheme spacegray
" colorscheme onedark
" colorscheme space-vim-dark
if !exists('$TMUX')
    if has("nvim") || version > 800
        set termguicolors
        set background=dark " or light if you prefer the light version
        "let g:two_firewatch_italics=1
        "colo two-firewatch
        "colo nord
        "let g:airline_theme='twofirewatch'

        let g:gruvbox_material_background = 'soft'
        let g:gruvbox_material_better_performance = 1
        colorscheme gruvbox-material

        hi SignColumn ctermbg=NONE guibg=NONE
        hi StatusLineNC guifg=#444444 guibg=#3a3a3a
        if has("nvim")
            hi TabLine cterm=None ctermbg=59 gui=None guibg=59
        elseif version > 800
            hi Comment cterm=none guifg=#5C6370 ctermfg=59
            hi TabLineSel ctermfg=70 ctermbg=234 guifg=#67b11d guibg=#212026 guisp=NONE cterm=NONE gui=NONE
            hi TabLine cterm=none guifg=#5C6370 ctermfg=59 guibg=#282c34
        endif
        
    else
        let g:material_style='palenight'
        set background=dark
        colorscheme space_vim_theme
        if version > 800
            set termguicolors
        endif
        "colorscheme onehalfdark
        "colorscheme vim-material
        "hi Normal     ctermbg=NONE guibg=NONE
        "hi LineNr     ctermbg=NONE guibg=NONE
        "hi SignColumn ctermbg=NONE guibg=NONE
        hi LineNr ctermbg=NONE guibg=NONE
        hi Comment guifg=#5C6370 ctermfg=59
    endif
else
    set background=dark 
    "colorscheme ayu
    colo nord
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
