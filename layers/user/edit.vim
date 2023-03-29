" 自动标记文件编辑的位置
function! SetFileMark()
    if &filetype != 'nerdtree' && &filetype != 'qf' && &filetype != 'tagbar' && &filetype != 'terminal'
        execute "normal! m\P" |
        execute "normal! `\P"
    endif
endfunction

augroup mark_position
    autocmd!
    autocmd InsertEnter * call SetFileMark()
augroup END

nnoremap <silent> ,i `P
