function! ShowNerdTree()
    if (exists(":NERDTreeTabsToggle") == 0)
        silent! exec "NERDTreeToggle"
    else
        silent! exec "NERDTreeTabsToggle"
    endif
endfunction

function! ShowTagbarToggle()
    if (exists(":Vista") > 0 )
        silent! exec "Vista!!"
    elseif (exists(":TagbarToggle") > 0 )
        silent! exec "TagbarToggle"
    else
        nmap <Leader>wf :Sex!<CR>
    endif
endfunction

function! ShowGunDo()
    if (exists(":GundoToggle") > 0 )
        silent! exec "GundoToggle"
    endif
endfunction

" jump to window
function! JumpToWindow(num)
    let l:winId = win_getid(a:num)
    if l:winId == 0
        return
    endif
    silent! call win_gotoid(l:winId)
endfunction

" jump to tab
function! JumpToTab(num)
    exec "tabn " . a:num
endfunction

" ToggleMouse 
let g:mouse_status = 0
function! ToggleMouse()
    if (g:mouse_status == 0) 
        let g:mouse_status = 1
        set mouse=nc
        set scrolloff=0
        echomsg "Mouse Active"
    else
        let g:mouse_status = 0
        set mouse=""
        set scrolloff=30
        echomsg "Mouse Disable"
    endif
endfunction

function! ToggleSyntax()
    if exists("g:syntax_on") 
        syntax off 
    else 
        syntax enable
    endif
endfunction

let g:toggle_list_data = {}
function! ToggleSet(type, firstCommand, secondCommand)
    if (get(g:toggle_list_data, a:type) == 0) 
        let g:toggle_list_data[a:type]=1
        exec a:firstCommand
    else
        let g:toggle_list_data[a:type]=0
        exec a:secondCommand
    endif
endfunction

let g:fzf_popup_status = 1
function! TogglePopup()
    if (g:fzf_popup_status == 0)
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
        let g:fzf_popup_status = 1
    else 
        let g:fzf_layout = { 'down': '~40%' }
        let g:fzf_popup_status = 0
    endif
endfunction

function! FernFindCurrentFile()
    silent! execute "Rooter"
    let l:filename = trim(expand('%'), './')
    if exists(":NERDTreeFind")
        if l:filename == 'Startify' || l:filename == ''
            silent! exec "NERDTree"
        else
            silent! exec "NERDTreeFind"
        endif
    else 
        "silent! exec "Fern . -drawer -reveal=" . l:filename
    endif
endfunction

function! ShowfindFiles()
    if (g:loaded_fzf > 0)
        "execute "FZF"
        call FzfFilesFunction()
    elseif (g:leaderf_loaded > 0)
        if (exists("g:Lf_ShortcutF"))
            execute "Leaderf"
        else
            let g:Lf_ShortcutF = '<Leader>zf'
            execute "Leaderf"
        endif
    else
        let findFileName = escape(input('find file: '), '/\&~')
        silent! execute "Find ".findFileName
    endif
endfunction


function! Find(cmd)
    if (executable('ag'))
        call fzf#run(fzf#wrap('fzffind', {'source': a:cmd}, 0))
    else
        let l:files = system(a:cmd)
        if (l:files =~ '^\s*$')
            echomsg 'No matching files.'
            return
        endif
        "new
        vne
        set filetype=filelist
        set buftype=nofile
        silent! put =l:files
        normal ggdd
        nnoremap <buffer> <Enter> <C-W>gf
        execute 'autocmd BufEnter <buffer> lcd ' . getcwd()
    endif
endfunction

function! BesideFile(type)
    let l:current_dir = expand("%:p:h")
    let l:current_file = expand("%:p:f")
    if (a:type == 'invert')
        let l:file_list = split(system("find " . l:current_dir . " -type f -maxdepth 1 ! -name '*.o' ! -name '.*' | sort -f -r"), "\n")
    else
        let l:file_list = split(system("find " . l:current_dir . " -type f -maxdepth 1 ! -name '*.o' ! -name '.*' | sort -f"), "\n")
    endif
    let l:current_index = -1
    let l:index = 0
    for item in l:file_list
        let l:index += 1
        if (item == l:current_file) 
            let l:current_index = l:index
        endif
        if (l:index == (l:current_index + 1))
            echomsg "open " . item
            silent! execute('e ' . item)
            break
        endif
    endfor
    if (l:current_index == l:index)
        echomsg "the last one"
    endif
endfunction

function! TagsJumpFunction()
    let s:current_word = expand("<cword>")
    exec "tag " . s:current_word
endfunction

function! FzfTagsFunction()
    let s:current_word = GetVisualSelection()
    exec "FzfTags " . s:current_word
endfunction
function! FzfFilesFunction()
    let s:current_word = GetVisualSelection()
    if len(s:current_word) == 0 
        let s:current_word = expand("<cword>")
    endif
    let g:fzf_files_options = ['-m', '--query', s:current_word]
    exec "FzfFiles"
    let g:fzf_files_options = ['-m', '--query', '']
endfunction
function! AckVisualSearch()
    let s:current_word = GetVisualSelection()
    exec "Ack " . substitute(escape(s:current_word, '\'), ' ', '\\ ', 'g')
endfunction

let g:ack_search_str = ""
function! AckReplace(is_replace)
    let l:search_str = input("Search String: ", g:ack_search_str)
    let g:ack_search_str = l:search_str
    if a:is_replace == 1
        let l:search_path = input("Search Path: ", "./", "file")
    elseif a:is_replace == 2
        let l:replace_str = input("Replace String: ", "")
    endif
    let l:search_str = GetRgSearchText(l:search_str)
    if a:is_replace == 2
        let l:replace_str = GetRgSearchText(l:replace_str)
    endif
 
    if a:is_replace == 2
        let l:replace_str = escape(l:replace_str, '/')
        let l:search_str = escape(l:search_str, '/')
        exec "Lacks /" . l:search_str . "/" . l:replace_str . "/ "
    elseif a:is_replace == 1
        exec "Lack " . l:search_str . " ". l:search_path
    else
        exec "Ag " . l:search_str
    endif
endfunction


function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction
" get Regular
function! GetSelectedText()
       let tmp = @"
       normal! gvy
       normal! gv
       let [tmp, @"] = [@", tmp]
       return tmp
endfunc

function! PlainTextPattern(s)
       return substitute(substitute('\V'.escape(a:s, '\'), '\n', '\\n', 'g'), '\t', '\\t', 'g')
endfunc

function! GetSearchPat()
    let @+ = PlainTextPattern(GetSelectedText())
endfunc

function! GetRgSearchTextV2(s)
    let l:s = a:s
    if len(l:s) == 0
        let l:s = GetVisualSelection()
    endif
    let l:reg_list = ['\\', '$', '-', '[', ']', '(', ')', '*', '{', '}', '?', '|', '.']

    for item in l:reg_list
        let l:s = escape(l:s, item)
    endfor

    let l:s = substitute(substitute(l:s, '\n', '\\n', 'g'), '\t', '\\t', 'g')
    return l:s
endfunction
function! GetCtrlsfSearchText(s)
    let l:s = a:s
    if len(l:s) == 0
        let l:s = GetVisualSelection()
    endif
    let l:reg_list = ['\\', '\\', '$', '[', ']', '(', ')', '*', '{', '}', '?', '|', '.', "'", "\""]

    for item in l:reg_list
        let l:s = escape(l:s, item)
    endfor

    let l:s = substitute(substitute(l:s, '\n', '\\n', 'g'), '\t', '\\t', 'g')
    return l:s
endfunction


function! GetRgSearchText(s)
    let l:s = a:s
    if len(l:s) == 0
        let l:s = GetVisualSelection()
    endif
    let l:reg_list = ['\\', '$', '-', '[', ']', '(', ')', ' ', '*', '{', '}', '?', '|', '.']

    for item in l:reg_list
        let l:s = escape(l:s, item)
    endfor

    " repalce \t \n
    let l:s = substitute(l:s, '\r', '\\r', 'g')
    let l:s = substitute(l:s, '\n', '\\n', 'g')
    let l:s = substitute(l:s, '\t', '\\t', 'g')

    return l:s
endfunction


function! InitTemplate()
    silent! execute 'Template *.' . expand('%:e')
endfunction

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

function! PhpUnitSwitchFile()
    let f = expand('%')
    let cmd = ''
    let is_test = expand('%:t') =~ "Test\."
    exec 'Rooter'
    let rpwd = getcwd()
    if is_test
        " remove phpunit_testroot
        let f = substitute(f,'^'.rpwd.'/tests/','','')
        " remove 'Test.' from filename
        let f = substitute(f,'Test\.','.','')
        let cmd = 'to '
    else
        let f = rpwd . "/tests/" . expand('%:r') . "Test.php"
        let cmd = 'bo '
    endif
    " is there window with complent file open?
    let win = bufwinnr(f)
    if win > 0
        execute win . "wincmd w"
    else
        execute cmd . "vsplit " . f
    endif
endfunction