Plug 'majutsushi/tagbar'", {'on': 'TagbarToggle' }

let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'n:namespaces',
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
        \]
    \}
"let g:tagbar_phpctags_bin='/usr/bin/ctags' 
