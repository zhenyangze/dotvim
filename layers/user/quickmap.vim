function! ToggleWindowShow(fileTypeName, openCommend, closeCommend)
    let l:current_window_id = win_getid()
    let l:fileTypeName = []
    if type(a:fileTypeName) != type([])
        call add(l:fileTypeName, a:fileTypeName)
    else 
        let l:fileTypeName = a:fileTypeName
    endif
    let l:has_quick_list = 0
    for index in range(1, winnr('$'))
        let l:window_id = win_getid(index)
        exec win_gotoid(l:window_id)

        let l:window_type = &filetype
        if index(l:fileTypeName, l:window_type) >= 0
            echo l:window_type
            let l:has_quick_list = 1
            break
        endif
    endfor
    if l:has_quick_list
        exec a:closeCommend
        silent! exec win_gotoid(l:current_window_id)
    else
        exec a:openCommend
    endif
endfunction

nmap ,f :FzfFiles<CR>
"nmap ,b :FzfBuffers<CR>
nmap ,h :Startify<CR>
nmap ,q :q!<CR>
nmap ,w :w!<CR>
nmap ,d :FzfDirs<CR>
nmap ,s :NERDTreeFind %<CR>
nmap ,r :Rooter<CR>
nmap ,c :call ToggleWindowShow('qf', 'copen', 'cclose')<CR>
nmap ,t :call ToggleWindowShow('nerdtree', 'NERDTreeTabsToggle', 'NERDTreeTabsToggle')<CR>
nmap ,o :call ToggleWindowShow('tagbar', 'TagbarToggle', 'TagbarToggle')<CR>
nmap ,b :call ToggleWindowShow(['conque_term', 'zsh'], 'call ShowShell()', 'quit')<CR>