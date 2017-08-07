function! RemoveUnmap()
    if !empty(maparg('<Space>zq'))
        silent! iunmap <buffer> <Space>zq
    endif
endfunction

au BufNewFile,BufRead * call RemoveUnmap()