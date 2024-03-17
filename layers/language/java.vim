Plug 'artur-shaik/vim-javacomplete2',{ 'for': 'java'}

let g:JavaComplete_EnableDefaultMappings = 1
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java set completefunc=javacomplete#CompleteParamsInf
autocmd FileType java,jsp inoremap <buffer>. .<C-X><C-O><C-P>


nmap <leader>jiA <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jir <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>jic <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jia <Plug>(JavaComplete-Imports-Add)
nmap <Leader>jis <Plug>(JavaComplete-Imports-SortImports)

nmap <leader>jgm <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jgA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>jgs <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jgg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>jga <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <leader>jgt <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jge <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jgC <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jgc <Plug>(JavaComplete-Generate-DefaultConstructor)

vmap <leader>jgs <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jgg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>jga <Plug>(JavaComplete-Generate-AccessorSetterGetter)


imap <leader>jgs <Plug>(JavaComplete-Generate-AccessorSetter)
imap <leader>jgg <Plug>(JavaComplete-Generate-AccessorGetter)
imap <leader>jga <Plug>(JavaComplete-Generate-AccessorSetterGetter)