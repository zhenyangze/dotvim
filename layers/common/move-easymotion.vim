Plug 'easymotion/vim-easymotion', { 'on': [] }

"vim-easymotion{{{
    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
""}}}

augroup load_easymotion
    autocmd!
    autocmd BufReadPost * silent! call plug#load('vim-easymotion') 
augroup END
