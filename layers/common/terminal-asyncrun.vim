Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
let g:asyncrun_bell = 1
let g:asyncrun_mode = "term"
let g:asyncrun_command = ""
if has("nvim")
    let g:asyncrun_mode = "async"
endif

function! AsyncRunSwitch()
    if g:asyncrun_mode == "term"
        let g:asyncrun_mode = "async"
        echo "switch async run mode: async"
    else
        let g:asyncrun_mode = "term"
        echo "switch async run mode: term"
    endif
endfunction

"nnoremap <Leader>at :call asyncrun#quickfix_toggle(6)<cr>
"nnoremap <silent> <leader>ac :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o shellescape(expand("%:r")) <cr>
"nnoremap <silent> <Leader>ar :AsyncRun -raw -cwd=$(VIM_FILEDIR) shellescape(expand("%:r")) <cr>
"nnoremap <silent> <Leader>am :AsyncRun -cwd=<root> cmake . <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
"nnoremap <silent> <Leader>ab :AsyncRun -cwd=<root> make <cr>
"nnoremap <silent> <Leader>ap :AsyncRun -cwd=<root> -mode=4 make run <cr>

function! AsyncRunMake()
    if &filetype == 'python'
        "execute 'CocCommand python.execInTerminal'
        "execute 'AsyncRun! -cwd=<root> -raw go build ' . shellescape(expand("%:f")) . ''
    elseif &filetype == 'go'
        let g:asyncrun_command = 'AsyncRun! -cwd=<root> -raw go build ' . shellescape(expand("%:f")) . ''
    elseif &filetype == 'rust'
        let g:asyncrun_command = 'AsyncRun! -cwd=<root> -raw cargo build --release'
    endif
    call AsyncRunRepeat()
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
        if match(l:funcName, "test") >= 0
            let g:asyncrun_command = 'AsyncRun! -mode=' . g:asyncrun_mode . ' -pos=bottom -rows=10 -cwd=<root> ./vendor/bin/phpunit tests --filter ' . l:funcName . ' ' . shellescape(expand("%:f"))
        else
            let g:asyncrun_command = 'AsyncRun! -mode=' . g:asyncrun_mode . ' -pos=bottom -rows=10 -cwd=<root> ./vendor/bin/phpunit tests' . ' ' . shellescape(expand("%:f"))
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
            let g:asyncrun_command = 'AsyncRun! -mode=' . g:asyncrun_mode . ' -pos=bottom -rows=10 -cwd=<root> -raw go test -v ' . shellescape(expand("%:f")) . ' -run="' . l:funcName . '"'
        else
            let g:asyncrun_command = 'AsyncRun! -mode=' . g:asyncrun_mode . ' -pos=bottom -rows=10 -cwd=<root> -raw go test -v ' . shellescape(expand("%:f")) . ''
        endif
    endif
    if &filetype == "rust"
        let g:asyncrun_command = "RustTest"
        "execute 'AsyncRun! -mode=' . g:asyncrun_mode . ' -pos=bottom -rows=10 -cwd=<root> -raw cargo test'
    endif
    if &filetype == "python"
        let g:asyncrun_command = 'CocCommand pyright.singleTest'
    endif
    call AsyncRunRepeat()
endfunction

function! AsyncRunRun()
    let l:command = ''
    if &filetype == 'php'
        let l:command = 'php '.shellescape(expand('%'))
    elseif &filetype == 'lua'
        let l:command = 'lua '.shellescape(expand('%'))
    elseif &filetype == 'c'
        let l:command = 'gcc -Wall -O2 "'.shellescape(expand('%:p')).'" -o "'.shellescape(expand('%:r')).'" && '.'./'.shellescape(expand('%:r'))
    elseif &filetype == 'cpp'
        let l:command = 'g++ -Wall -O2 "'.shellescape(expand('%:p')).'" -o "'.shellescape(expand('%:r')).'" -levent && '.'./'.shellescape(expand('%:r'))
    elseif &filetype == 'python'
        let l:command = 'python %'
    elseif &filetype == 'go'
        if len(matchstr(expand('%:t'), '_test.go')) > 0
            let l:command = 'go test -v '.shellescape(expand('%'))
        else
            let l:command = 'go run '.shellescape(expand('%'))
        endif
    elseif &filetype == 'sh'
        let l:command = 'sh '.shellescape(expand('%'))
    elseif &filetype == 'java'
        let l:command = 'javac '.shellescape(expand('%')) .' && java '.shellescape(expand('%:t:r'))
    elseif &filetype == 'rust'
        let l:command = "cargo run"
    endif
    let g:asyncrun_command = 'AsyncRun! -mode='.g:asyncrun_mode.' -pos=bottom -rows=10 -cwd=<root> '.l:command
    call AsyncRunRepeat()
endfunction

function! AsyncRunProject()
endfunction

function! AsyncRunRepeat()
    if g:asyncrun_command != ""
        exec g:asyncrun_command
    endif
endfunction