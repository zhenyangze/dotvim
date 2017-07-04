if has('nvim')
    Plug 'phpvim/phpcd.vim', { 'for': 'php', 'do': 'composer update' }
    " phpcd{{{
    autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
    " }}}
endif


Plug 'stephpy/vim-php-cs-fixer' ,{ 'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace',{ 'for': 'php'}
Plug 'joonty/vdebug', {'for': 'php'} 


" vdebug" {{{
if !exists("g:vdebug_options")
    let g:vdebug_options = {
                \    'break_on_open': 1,
                \    'port': '9000',
                \    'watch_window_style': 'compact',
                \    'ide_key': 'xdebug'
                \}
    let g:debuggerMaxDepth = 5  
endif
" }}}

