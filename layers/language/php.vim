"Plug 'stephpy/vim-php-cs-fixer' ,{ 'for': 'php'}
"Plug 'arnaud-lb/vim-php-namespace',{ 'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'xwsoul/vim-zephir', {'for': 'zep'}
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}

".phpcd.vim 
"创建 .autoload.php 文件，并写入以下内容：
"require_once __DIR__ . '/vendor/autoload.php';
"require_once __DIR__ . '/_ide_helper.php';
"创建 .phpcd.vim 文件，并写入以下内容：
"let g:phpcd_autoload_path = 'path/to/autoload_file.php'

" .phpactor.json
"{
    ""composer.autoloader_path": "%project_root%\/thinkphp\/base.php"
"}

" {{{vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0
"let g:vim_php_refactoring_phpdoc = '<SNR>85_DoxygenCommentFunc'
" }}}
" vim-namespace
autocmd BufRead,BufNewFile *.blade.php set filetype=html
