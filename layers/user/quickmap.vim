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

"nmap ,b :FzfBuffers<CR>
nmap ,a gg0vG$<CR>
if version > 800
tmap ,b <C-w>:call ToggleWindowShow(['conque_term', 'zsh'], 'VSTerminalToggle', 'quit')<CR>
endif
nmap ,b <C-w>:call ToggleWindowShow(['conque_term', 'zsh'], 'VSTerminalToggle', 'quit')<CR>
nmap ,c :call ToggleWindowShow('qf', 'copen', 'cclose')<CR>
nmap ,d :FzfDirs<CR>
nmap ,D :Dox<CR>
nmap ,f :RgFiles<CR>
vmap ,f :<C-u>call FzfFilesFunction()<CR>
nmap ,F :call FzfFilesFunction()<CR>
nmap ,g :Ag<CR>
vmap ,g :<C-u>Ag <C-R>=expand("<cword>")<CR><CR>
nmap ,G :Ag <C-R>=expand("<cword>")<CR><CR>
nmap ,h :Startify<CR>
nmap ,n :tabnew<CR>
nmap ,o :call ToggleWindowShow('tagbar', 'call ShowTagbarToggle()', 'call ShowTagbarToggle()')<CR>
nmap ,q :q!<CR>
"nmap ,p :ProjectList<cr>
nmap ,p :FzfProject<cr>
nmap ,r :Rooter<CR>
nmap ,s :call FernFindCurrentFile()<CR>
"nmap ,t :silent! Fern . -drawer<CR>
nmap ,t :TagbarToggle<CR>
nmap ,w :w!<CR>
nmap ,y :YRShow<CR>
nmap ,1 :call JumpToWindow(1)<CR>
nmap ,2 :call JumpToWindow(2)<CR>
nmap ,3 :call JumpToWindow(3)<CR>
nmap ,4 :call JumpToWindow(4)<CR>
nmap ,5 :call JumpToWindow(5)<CR>

nmap =1 :q 1<CR>
nmap =2 :q 2<CR>
nmap =3 :q 3<CR>
nmap =4 :q 4<CR>
nmap =5 :q 5<CR>

noremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

nmap [c <plug>(signify-prev-hunk)
nmap ]c <plug>(signify-next-hunk)

nnoremap [s :<c-u>ALEPrevious<cr>
nnoremap ]s :<c-u>ALENext<cr>

nnoremap [t :<c-u>pop<cr>
nnoremap ]t :<c-u>call TagsJumpFunction()<cr>


nnoremap [b :<c-u>bp<cr>
nnoremap ]b :<c-u>bn<cr>

nnoremap [f :<c-u>call BesideFile("invert")<cr>
nnoremap ]f :<c-u>call BesideFile("")<cr>

nmap [q :<c-u>cp<cr>
nmap ]q :<c-u>cn<cr>
