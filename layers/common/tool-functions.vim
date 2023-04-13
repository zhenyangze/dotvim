"{{{common function
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
    silent! exec "tabn " . a:num
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
        silent! exec a:firstCommand
    else
        let g:toggle_list_data[a:type]=0
        silent! exec a:secondCommand
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
    if &filetype == "nerdtree"
        return
    endif
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
            silent! execute "Leaderf"
        else
            let g:Lf_ShortcutF = '<Leader>zf'
            silent! execute "Leaderf"
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
        silent! execute 'autocmd BufEnter <buffer> lcd ' . getcwd()
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
    silent! exec "FzfTags " . s:current_word
endfunction
function! FzfFilesFunction()
    let s:current_word = GetVisualSelection()
    if len(s:current_word) == 0 
        let s:current_word = trim(expand('<cfile>'), './')
    endif
    let g:fzf_files_options = ['-m', '--query', s:current_word]
    silent! exec "FzfFiles"
    let g:fzf_files_options = ['-m', '--query', '']
endfunction
function! AckVisualSearch()
    let s:current_word = GetVisualSelection()
    silent! exec "Ack " . substitute(escape(s:current_word, '\'), ' ', '\\ ', 'g')
endfunction

let g:ack_search_str = ""
function! AckReplace(is_replace)
    let l:search_str = input("Search String: ", "")
    let g:ack_search_str = l:search_str
    if a:is_replace == 1
        let l:search_path = input("Search Path: ", "./", "file")
    elseif a:is_replace == 2
        let l:replace_str = input("Replace String: ", "")
    endif

    if l:search_str == ""
        return
    endif

    if a:is_replace == 2
        if !has('nvim') 
            let l:search_str = GetRgSearchText(l:search_str)
            let l:replace_str = GetRgSearchText(l:replace_str)
        endif

        let l:replace_str = escape(l:replace_str, '/')
        let l:search_str = escape(l:search_str, '/')
        silent! exec "Acks /" . l:search_str . "/" . l:replace_str . "/ "
    elseif a:is_replace == 1
        let l:search_str = GetRgSearchText(l:search_str)
        silent! exec "Ack " . l:search_str . " ". l:search_path
    else
        let l:search_str = GetRgSearchText(l:search_str)
        silent! exec "Ag " . l:search_str
    endif
endfunction

function! FindFileToQuickfix(fileName, filePath = ".")
    let l:fileName = a:fileName
    let l:filePath = a:filePath
    if l:fileName == "" 
        let l:fileName = input("Search File Name: ", "", "file")
        let l:filePath = input("Search File Path: ",  "./", "file")
    end
    if l:filePath == ""
        let l:filePath = "."
    end
    if l:fileName == ""
        return
    end
    "cexpr glob('**/' . a:fileName, v:true, v:true)->map({_, v -> v..'|1| '..v})
    cexpr split(system('rg ' . shellescape(l:filePath) . ' --files --sort=path --hidden --follow --glob "!.git/*" 3>/dev/null | grep -v ".gitkeep" | grep -v ".gitignore" | grep -i ' . l:fileName))->map({_, v -> v..'|1| '..v})
    cw
endfunction
command! -nargs=+ -complete=file Fd call FindFileToQuickfix(<f-args>)

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
    let l:reg_list = ['\\', '\\', '$', '[', ']', '(', ')', '*', '{', '}', '?', '|', '.', "'", "\"", '+']

    for item in l:reg_list
        "let l:s = escape(l:s, item)
    endfor

    "let l:s = substitute(substitute(l:s, '\n', '\\n', 'g'), '\t', '\\t', 'g')
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

function! AppendText(type)
    let l:append_text = input("Append String: ", "")
    if len(l:append_text) == 0
        return
    endif
    if a:type == 1
        silent! exec "%s/$/" . l:append_text . "/g" 
    elseif a:type == 2
        silent! exec "g/\\S\\+/s/$/" . l:append_text . "/g" 
    elseif a:type == 3
        silent! exec "%s/^/" . l:append_text . "/g" 
    elseif a:type == 4
        silent! exec "g/\\S\\+/s/^/" . l:append_text . "/g" 
    endif
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
        silent! exec a:closeCommend
        silent! call win_gotoid(l:current_window_id)
    else
        silent! exec a:openCommend
    endif
endfunction
function! JumpToWindow(winNo) 
    let l:window_id = win_getid(a:winNo)
    if l:window_id >= 1000
        call win_gotoid(l:window_id)
    endif
endfunction

function! AutoFormatFile()
    let l:filetype = &filetype
    if l:filetype == "php"
        silent! exec "Format"
    elseif l:filetype == "java"
        silent! exec "Format"
    else
        silent! exec "Autoformat"
    endif
    echomsg "Formated"
endfunction

function! ChangeColorchemes()
  " 获取当前主题
  let current_theme = g:colors_name

  " 获取所有主题
  let all_themes = getcompletion('', 'color')

  " 获取下一个主题
  let next_theme = all_themes[0]
  for theme in all_themes
    if theme == current_theme
      let next_theme = all_themes[(index(all_themes, theme) + 1) % len(all_themes)]
      break
    endif
  endfor

  " 切换到下一个主题
  execute 'colorscheme' next_theme
  echo "colorscheme:" . next_theme
endfunction

"}}}

"{{{============================= language ================================
function! LangFunctionCall(method)
    let l:filetype = &filetype
    let l:firstLetter = strpart(l:filetype, 0, 1)
    let l:funcName = toupper(l:firstLetter) . strpart(l:filetype, 1) . a:method
    if exists("*" . l:funcName)
        silent! exec 'call ' . l:funcName . '()'
    else
        echomsg "function not found: " . l:funcName
    endif
endfunction
function! LangRenameLocalVariable()
    call LangFunctionCall("RenameLocalVariable")
endfunction

function! LangRenameClassVariable()
    call LangFunctionCall("RenameClassVariable")
endfunction

function! LangRenameMethod()
    call LangFunctionCall("RenameMethod")
endfunction

function! LangExtractExpression()
    call LangFunctionCall("ExtractExpression")
endfunction

function! LangClassExpand()
    call LangFunctionCall("ClassExpand")
endfunction

function! LangExtractConst()
    call LangFunctionCall("ExtractConst")
endfunction

function! LangExtractUse()
    call LangFunctionCall("ExtractUse")
endfunction

function! LangExtractClassProperty()
    call LangFunctionCall("ExtractClassProperty")
endfunction

function! LangExtractMethod()
    call LangFunctionCall("ExtractMethod")
endfunction

function! LangClassNew()
    call LangFunctionCall("ClassNew")
endfunction

function! LangClassInflect()
    call LangFunctionCall("ClassInflect")
endfunction

function! LangChangeVisibility()
    call LangFunctionCall("ChangeVisibility")
endfunction

function! LangGenerateAccessors()
    call LangFunctionCall("GenerateAccessors")
endfunction

function! LangCreateSettersAndGetters()
    call LangFunctionCall("CreateSettersAndGetters")
endfunction

function! LangCreateGetters()
    call LangFunctionCall("CreateGetters")
endfunction

function! LangImportClass()
    call LangFunctionCall("ImportClass")
endfunction

function! LangImportMissingClasses()
    call LangFunctionCall("ImportMissingClasses")
endfunction

function! LangGotoDefinition()
    call LangFunctionCall("GotoDefinition")
endfunction
function! LangGotoImplementations()
    call LangFunctionCall("GotoImplementations")
endfunction
function! LangFindReferences()
    call LangFunctionCall("FindReferences")
endfunction
function! LangDocAll()
    call LangFunctionCall("DocAll")
endfunction
function! LangUnitSwitchFile()
    call LangFunctionCall("UnitSwitchFile")
endfunction
function! LangTransform()
    call LangFunctionCall("Transform")
endfunction
function! LangHover()
    call LangFunctionCall("Hover")
endfunction
function! LangContextMenu()
    call LangFunctionCall("ContextMenu")
endfunction
"============================= language end ============================ }}}
