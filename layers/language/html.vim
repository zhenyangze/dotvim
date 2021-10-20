Plug 'mattn/emmet-vim',{'for':['html','php', 'htm', 'blade']}
Plug 'Valloric/MatchTagAlways', {'for':['html', 'blade']}
Plug 'chrisgillis/vim-bootstrap3-snippets', {'for':['html','php', 'htm', 'blade']}
Plug 'maksimr/vim-jsbeautify', {'for':['html', 'xhtml', 'js', 'css', 'jsx', 'json'], 'do': 'git submodule update --init --recursive'}

" emmet-vim"{{{
    let g:user_emmet_mode='n'    "only enable normal mode functions.
    let g:user_emmet_mode='inv'  "enable all functions, which is equal to
    let g:user_emmet_mode='a'    "enable all function in all mode.
    let g:user_emmet_install_global = 0
" }}}
