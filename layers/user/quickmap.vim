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
        call win_gotoid(l:window_id)

        let l:window_type = &filetype
        if index(l:fileTypeName, l:window_type) >= 0
            let l:has_quick_list = 1
            break
        endif
    endfor
    if l:has_quick_list
        exec a:closeCommend
        silent! call win_gotoid(l:current_window_id)
    else
        exec a:openCommend
    endif
endfunction
function! JumpToWindow(winNo) 
    let l:window_id = win_getid(a:winNo)
    if l:window_id >= 1000
        call win_gotoid(l:window_id)
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
nmap ,n :tabnew<CR>
nmap ,y :YRShow<CR>
nmap ,a gg0vG$<CR>
nmap ,c :call ToggleWindowShow('qf', 'copen', 'cclose')<CR>
nmap ,t :call ToggleWindowShow('nerdtree', 'call ShowNerdTree()', 'call ShowNerdTree()')<CR>
nmap ,o :call ToggleWindowShow('tagbar', 'call ShowTagbarToggle()', 'call ShowTagbarToggle()')<CR>
nmap ,b :call ToggleWindowShow(['conque_term', 'zsh'], 'call ShowShell()', 'quit')<CR>
nmap ,1 :call JumpToWindow(1)<CR>
nmap ,2 :call JumpToWindow(2)<CR>
nmap ,3 :call JumpToWindow(3)<CR>
nmap ,4 :call JumpToWindow(4)<CR>
nmap ,5 :call JumpToWindow(5)<CR>