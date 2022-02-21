Plug 'scrooloose/nerdcommenter', { 'on': [] } " 快速注释 leader  ca ci  cA
augroup load_nerdcommenter
    autocmd!
    autocmd BufReadPost * call plug#load('nerdcommenter') 
augroup END