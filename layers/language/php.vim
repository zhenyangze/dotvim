Plug 'stephpy/vim-php-cs-fixer' ,{ 'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace',{ 'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
if version > 800
Plug 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup = 1
endif
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
Plug 'beanworks/vim-phpfmt', { 'for': 'php' }
" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
let g:phpfmt_standard = 'PSR2'
"let g:phpfmt_standard = '/path/to/custom/standard.xml'
let g:phpfmt_autosave = 0

".phpcd.vim 
"创建 .autoload.php 文件，并写入以下内容：
"require_once __DIR__ . '/vendor/autoload.php';
"require_once __DIR__ . '/_ide_helper.php';
"创建 .phpcd.vim 文件，并写入以下内容：
"let g:phpcd_autoload_path = 'path/to/autoload_file.php'

" {{{vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0
"let g:vim_php_refactoring_phpdoc = '<SNR>85_DoxygenCommentFunc'
" }}}
" vim-namespace
autocmd BufRead,BufNewFile *.blade.php set filetype=html
