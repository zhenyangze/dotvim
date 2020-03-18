Plug 'artur-shaik/vim-javacomplete2',{ 'for': 'java'}

let g:JavaComplete_EnableDefaultMappings = 0
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java set completefunc=javacomplete#CompleteParamsInf
autocmd FileType java,javascript,jsp inoremap <buffer>. .<C-X><C-O><C-P>