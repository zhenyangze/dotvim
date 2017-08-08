if has('nvim')
    Plug 'roxma/nvim-completion-manager'
    Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
    " (optional) php completion via LanguageClient-neovim
    Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
    autocmd FileType php LanguageClientStart
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    inoremap <c-c> <ESC>
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
    inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr> 
endif


Plug 'stephpy/vim-php-cs-fixer' ,{ 'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace',{ 'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
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
