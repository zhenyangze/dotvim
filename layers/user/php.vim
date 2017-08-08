function! RunDox()
    "call <SNR>85_DoxygenCommentFunc()
    redir => s:tempList
    silent! exec 'fu /DoxygenCommentFunc$'
    redir END
    
    let s:result = split(s:tempList)
    let s:funcName = s:result[1]
    if (len(s:funcName) < 10)
        return
    endif
    "let s:funcName = substitute(s:funcName, '(', "", "")
    "let s:funcName = substitute(s:funcName, ')', "", "")
    silent! exec 'call ' . s:funcName
endfunction


"let g:vim_php_refactoring_phpdoc = '<SNR>85_DoxygenCommentFunc'
let g:vim_php_refactoring_phpdoc = 'RunDox'