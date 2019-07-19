Plug 'stephpy/vim-php-cs-fixer' ,{ 'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace',{ 'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
if has('python3')
    Plug 'joonty/vdebug', {'for': 'php'} 
endif
Plug 'Shougo/echodoc.vim'
set noshowmode
let g:echodoc_enable_at_startup = 1
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'phpactor/phpactor', {'do': 'composer install'}
Plug 'beanworks/vim-phpfmt', { 'for': 'php' }
Plug 'zhenyangze/vim-laravel5-snippets', { 'for': 'php' }
" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
let g:phpfmt_standard = 'PSR2'
"let g:phpfmt_standard = '/path/to/custom/standard.xml'
let g:phpfmt_autosave = 0
"nnoremap <silent><nowait> <leader>pg :call phpcd#JumpToDefinition('normal')<CR>
nnoremap <silent><nowait> <leader>pgb :call phpcd#JumpBack()<CR>
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
nnoremap <Leader>prv :call PhpRenameLocalVariable()<CR>
nnoremap <Leader>prc :call PhpRenameClassVariable()<CR>
nnoremap <Leader>prm :call PhpRenameMethod()<CR>
nnoremap <Leader>peu :call PhpExtractUse()<CR>
vnoremap <Leader>pec :call PhpExtractConst()<CR>
nnoremap <Leader>pep :call PhpExtractClassProperty()<CR>
vnoremap <Leader>pem :call PhpExtractMethod()<CR>
nnoremap <Leader>pcp :call PhpCreateProperty()<CR>
nnoremap <Leader>pdu :call PhpDetectUnusedUseStatements()<CR>
vnoremap <Leader>pas :call PhpAlignAssigns()<CR>
nnoremap <Leader>pcs :call PhpCreateSettersAndGetters()<CR>
nnoremap <Leader>pcg :call PhpCreateGetters()<CR>
nnoremap <Leader>pda :call PhpDocAll()<CR>
" }}}
" phpactor {{{
" Include use statement
nmap <Leader>pua :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>pcm :call phpactor#ContextMenu()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>pgd :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
nmap <Leader>ptf :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>pcn :call phpactor#ClassNew()<CR>
nmap <Leader>pgn :call phpactor#Navigate()<CR>
nmap <silent><Leader>pi :call phpactor#Hover()<CR>
nmap <silent><Leader>pee :call phpactor#ExtractExpression(v:false)<CR>
vmap <silent><Leader>pee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
"vmap <silent><Leader>pem :<C-U>call phpactor#ExtractMethod()<CR>
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
autocmd BufRead,BufNewFile *.blade.php set filetype=html
