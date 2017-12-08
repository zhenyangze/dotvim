Plug 'junegunn/vim-easy-align'

nmap <Leader>a <Plug>(EasyAlign)
xmap <Leader>a <Plug>(EasyAlign)

if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" Default:
" If a delimiter is in a highlight group whose name matches any of the followings, it will be ignored.
let g:easy_align_ignore_groups = ['Comment', 'String']
