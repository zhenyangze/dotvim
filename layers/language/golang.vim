"Plug 'nsf/gocode', {'rtp': 'vim/', 'for': 'go'}
Plug 'fatih/vim-go', {'tag': '*', 'for': 'go'}
"Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" vim-go " {{{golang
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_interfaces = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_template_autocreate = 0
    au FileType go nmap <leader>gr <Plug>(go-run)
    au FileType go nmap <leader>gb <Plug>(go-build)
    au FileType go nmap <leader>gt <Plug>(go-test)
    au FileType go nmap <leader>gc <Plug>(go-coverage)
    au FileType go nmap <Leader>gds <Plug>(go-def-split)
    au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" }}}
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']