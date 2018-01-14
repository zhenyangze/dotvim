Plug 'stephpy/vim-php-cs-fixer' ,{ 'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace',{ 'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'joonty/vdebug', {'for': 'php'} 
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'phpactor/phpactor', {'do': 'composer install'}
nnoremap <silent><nowait> <leader>pg :call phpcd#JumpToDefinition('normal')<CR>
nnoremap <silent><nowait> <leader>pb :call phpcd#JumpBack()<CR>
"Plug 'joonty/vim-phpqa', {'for': 'php'}

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
" {{{vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0
"let g:vim_php_refactoring_phpdoc = '<SNR>85_DoxygenCommentFunc'
nnoremap <unique> <Leader>prv :call PhpRenameLocalVariable()<CR>
nnoremap <unique> <Leader>prc :call PhpRenameClassVariable()<CR>
nnoremap <unique> <Leader>prm :call PhpRenameMethod()<CR>
nnoremap <unique> <Leader>peu :call PhpExtractUse()<CR>
vnoremap <unique> <Leader>pec :call PhpExtractConst()<CR>
nnoremap <unique> <Leader>pep :call PhpExtractClassProperty()<CR>
vnoremap <unique> <Leader>pem :call PhpExtractMethod()<CR>
nnoremap <unique> <Leader>pcp :call PhpCreateProperty()<CR>
nnoremap <unique> <Leader>pdu :call PhpDetectUnusedUseStatements()<CR>
vnoremap <unique> <Leader>pas :call PhpAlignAssigns()<CR>
nnoremap <unique> <Leader>pcs :call PhpCreateSettersAndGetters()<CR>
nnoremap <unique> <Leader>pcg :call PhpCreateGetters()<CR>
nnoremap <unique> <Leader>pda :call PhpDocAll()<CR>
" }}}
" vim-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pui <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pui :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pue <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pue :call PhpExpandClass()<CR>
