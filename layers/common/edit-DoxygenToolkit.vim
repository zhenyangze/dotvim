Plug 'vim-scripts/DoxygenToolkit.vim'

" dooxygentookit"{{{
if !exists("g:DoxygenToolkit_briefTag_pre")
    let g:DoxygenToolkit_briefTag_pre=""
    let g:DoxygenToolkit_briefTag_funcName='yes'
    let g:DoxygenToolkit_authorName="zhenyangze <zhenyangze@gmail.com>"
    let g:doxygen_enhanced_color=1
endif
" }}}