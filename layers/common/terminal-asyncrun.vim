Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

"nnoremap <Leader>at :call asyncrun#quickfix_toggle(6)<cr>
"nnoremap <silent> <leader>ac :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"nnoremap <silent> <Leader>ar :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"nnoremap <silent> <Leader>am :AsyncRun -cwd=<root> cmake . <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
"nnoremap <silent> <Leader>ab :AsyncRun -cwd=<root> make <cr>
"nnoremap <silent> <Leader>ap :AsyncRun -cwd=<root> -mode=4 make run <cr>

function! AsyncRunMake()
    if &filetype == 'python'
        execute 'CocCommand python.execInTerminal'
    elseif &filetype == 'go'
        execute 'AsyncRun! -cwd=<root> -raw go build "$(VIM_RELNAME)"'
    endif
endfunction

function! AsyncRunTest()
    if &filetype == 'php'
        let save_cursor = getcurpos()

        let l:line = getline(".")
        if match(l:line, "function test") < 0 
            normal [[
            let l:line = getline(".")
        endif
        let l:funcIndex = match(l:line, "test") + 1
        for i in  range(l:funcIndex)
            normal l
        endfor
        let l:funcName = expand("<cword>")
        call setpos('.', save_cursor)
        if match(l:funcName, "test") == 0 
            execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> ./vendor/bin/phpunit $(VIM_RELNAME) --filter ' . l:funcName
        else
            execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> ./vendor/bin/phpunit $(VIM_RELNAME)'
        endif
    endif
    if &filetype == 'go'
        let save_cursor = getcurpos()

        let l:line = getline(".")
        if match(l:line, "func Test") < 0 
            normal [[
            let l:line = getline(".")
        endif
        let l:funcIndex = match(l:line, "Test") + 1
        for i in  range(l:funcIndex)
            normal l
        endfor
        let l:funcName = expand("<cword>")
        call setpos('.', save_cursor)
        if match(l:funcName, "Test") == 0 
            execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> -raw go test -v "$(VIM_RELNAME)" -run="' . l:funcName . '"'
        else
            execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> -raw go test -v "$(VIM_RELNAME)"'
        endif
    endif
endfunction



function! AsyncRunRun()
    if &filetype == 'php'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> php $(VIM_RELNAME)'
    elseif &filetype == 'lua'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> lua $(VIM_RELNAME)'
    elseif &filetype == 'c'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" ; "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &filetype == 'cpp'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 g++ -Wall -O2 "$(VIM_FILEPATH)" -levent -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" ; "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &filetype == 'python'
        execute 'CocCommand python.execInTerminal'
        "let $PYTHONNUNBUFFERED=1
        "execute 'AsyncRun! -cwd=<root> -raw python %'
        let $PYTHONNUNBUFFERED=1
    elseif &filetype == 'go'
        if len(matchstr(expand('%:t'), '_test.go')) > 0
            execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> -raw go test -v "$(VIM_RELNAME)"'
        else
            execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> -raw go run "$(VIM_RELNAME)"'
        endif
    elseif &filetype == 'sh'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> sh "$(VIM_RELNAME)"'
    elseif &filetype == 'java'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> javac "$(VIM_RELNAME)" ; java $(VIM_FILENOEXT)'
    endif
endfunction

function! AsyncRunProject()
endfunction