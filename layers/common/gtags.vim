Plug 'jsfaint/gen_tags.vim'
Plug 'whatot/gtags-cscope.vim'
"gen_tags
let g:gen_tags#gtags_auto_gen = 0

" cscope
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope

" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

let g:Gtags_OpenQuickfixWindow = 1
" 启用一些推荐的快捷键，默认不开启
let g:Gtags_Auto_Map = 0 
let g:Gtags_Auto_Update = 0