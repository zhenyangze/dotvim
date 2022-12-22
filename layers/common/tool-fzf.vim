Plug 'junegunn/fzf', {'do': './install --all'  }
Plug 'junegunn/fzf.vim'

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"  fzf {{{
"set rtp+=~/.fzf
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }
let $FZF_DEFAULT_OPTS = '--bind ctrl-q:select-all+accept'

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
if version > 801
    autocmd! FileType fzf
    autocmd  FileType fzf set noshowmode noruler nonu
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 0
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
imap <C-x><C-b> <plug>(fzf-complete-buffer-line)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('down', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -U --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>) . ' 2> /dev/null', 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('down:50%', '?'),
  \   <bang>0)

command! -bang -nargs=* RgAll
  \ call fzf#vim#grep(
  \   'rg -U --column --line-number --no-heading --color=always --no-ignore --smart-case '.shellescape(<q-args>) . ' 2> /dev/null', 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('down:50%', '?'),
  \   <bang>0)

autocmd VimEnter * command! -bang Colors
            \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* FzfTodo
  \ call fzf#vim#ag('[^\w_\$\''''\>](FIXME|TODO|todo|fixme|Todo|ToDo|toDo|FEATURE|feature|Feature):?[^\w_\/\(\'''']',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('down', '?'),
  \                 <bang>0)

command! -bang -nargs=* FzfPHPClass
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "^[\s]*class\s+(\S+)" 2> /dev/null', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('down', '?'),
            \   <bang>0
            \ )

command! -bang -nargs=* FzfPHPFunction
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "^[\s]*(private|protected|public)?\s*(static)?\s*function\s+(\S+)" 2> /dev/null', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('down', '?'),
            \   <bang>0
            \ )

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '\S*$',
            \ 'source': 'rg -n ^ --color always .',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

command! -bang -nargs=* FzfWPHook
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "(apply_filters|do_action)(_ref_array)?" 2> /dev/null', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('down', '?'),
            \   <bang>0
            \ )
command! -bang -nargs=* FzfWPHookDef
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "(add_filter|add_action)" 2> /dev/null', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('down', '?'),
            \   <bang>0
            \ )

function! s:fzfdir(e) 
    let l:filename = trim(a:e, './')
    if exists(":NERDTreeFind")
        silent! exec 'NERDTreeFind ' . l:filename . '/'
    else
        silent! exec 'Fern  . -reveal=' . l:filename . ' -drawer'
    endif
endfunction

command! -bang FzfDirs
            \ call fzf#run(fzf#wrap('fzfdirs', {'source':'find .  -type d  \( ! -iname ".*" \) 2> /dev/null | sed "s|^\./||g" | grep -v "^\."', 'sink': function('<sid>fzfdir')}, 0))

let g:fzf_command_prefix = 'Fzf'
let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case '
"}}}
"
" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g "" 2> /dev/null'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  command! -bang RgFiles 
              \ call fzf#run(fzf#wrap('RgFiles', {'source':'rg --files --sort=path --hidden --follow --glob "!.git/*" 3>/dev/null | grep -v ".gitkeep" | grep -v ".gitignore"' , 'options': ['--ansi', '--delimiter', '/', '--nth', '-2..,..']}, 0))

endif

function! FzfProjectList()
  call project#load()
  let list = exists('g:vim_project_projects')
        \ ? g:vim_project_projects
        \ : []

  let showList = []
  let max = {}
  for item in list
    for key in keys(item)
      if !has_key(max, key)
            \|| (type(item[key]) == v:t_string && len(item[key]) > max[key])
        let max[key] = len(item[key])
      endif
    endfor
  endfor

  for item in list
    for key in keys(item)
      if type(item[key]) == v:t_string && key[0:1] != '__'
        let item['__'.key] = s:AddRightPadding(item[key], max[key])
      endif
    endfor
  endfor

  for item in list
      call add(showList, join([item['__name'], "\t", item['__path']], ''))
  endfor

  return showList
endfunction

function! s:FzfProjectOpen(projectName)
    let s:projectList = split(a:projectName, "\t")
    if (len(s:projectList) != 2) 
        return
    endif

    let s:project_name = trim(s:projectList[0])

    exec "ProjectOpen '" . s:project_name . "'"
endfunction

function! s:AddRightPadding(string, length)
  let padding = repeat(' ', a:length - len(a:string))
  return a:string.padding
endfunction

command! -bang FzfProject
    \ call fzf#run(fzf#wrap('fzfsession', {'source': FzfProjectList(), 'sink': function('s:FzfProjectOpen')}, 0))

command! -bang FzfChangeFiles 
            \ call fzf#run(fzf#wrap('FzfChangeFiles', {'source': 'git status --porcelain | sed s/^...//', 'options': ['--layout=reverse', '--info=inline', '--preview','~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, 0))

command! -bang FzfArtisan
    \ call fzf#run(fzf#wrap('fzfartisan', {'source': 'php artisan | grep ":" | awk "{print \$1}"', 'sink': 'fzfAg'}, 0))

"command! -bang FzfGtags
            "\ call fzf#run(fzf#wrap('FzfGtags', fzf#vim#with_preview({'source': 'cd ' . gen_tags#get_db_dir() . ' && global -x . --path-style="through" | sed "s/\.\///" | awk "{ print \$3\":\"\$2\"\\t:\"\$1\"\\t\"\$3 }" ', 'sink': 'CscopeFind', 'options': ["--delimiter=:", '--with-nth', '3..', '--preview-window', '+{2}-/2']}), 0))

function! CscopeFind(line)
    let l:fileName = split(a:line)[0]
    let l:fileLineNum = split(l:fileName, ":")[1]
    let l:fileName = split(l:fileName, ":")[0]
    execute 'e ' . trim(trim(l:fileName), '\')
    execute ':' . trim(trim(l:fileLineNum), '\')
endfunction

function! FzfCscope(option, query)
    if stridx(a:query, '<cword>') == 0
        let l:symbol = trim(expand(a:query))
    else
        let l:symbol = trim(a:query)
    endif
    if strlen(l:symbol) == 0
        let l:symbol = input("Input the Symbol: ")
        call FzfCscope(a:option, l:symbol)
        return
    endif

    if a:option == "tag"
        let l:output = execute('silent! cstag ' . l:symbol)
    else 
        let l:output = execute('silent! cs find ' . a:option . ' ' . l:symbol)
    endif
    let l:cscopeList = split(l:output, "\n")
    if len(l:cscopeList) == 0
        echomsg "没有找到匹配的结果"
        return
    endif
    let l:newcscopeList = []
    let l:nums = -1
    let l:tempStr = ''
    let l:start = 0
    for item in l:cscopeList
        let l:nums += 1 
        if l:nums <= 1
            continue
        endif

        if stridx(item, '(empty cancels)') > -1 || stridx(item, 'Type number and') > -1
            continue
        endif

        let item = trim(item)
        let l:itemList = split(item)
        let l:type = 0
        if match(item, '^\d\{1,\}\s*\d\{1,\}\s*\S*[\s*<<\S*>>]*') > -1
            let l:type = 1
            let l:start = 1
        elseif match(item, '^<<\s*\S*>>') > -1
            let l:type = 3
            continue
        endif

        if l:start < 1 
            echomsg "没有找到匹配的结果"
            return
        endif

        if (l:type == 1)
            if (l:tempStr != '')
                call add(l:newcscopeList, l:tempStr)
                let l:tempStr = ''
            endif
            if (stridx(l:itemList[2], getcwd()) == 0 && strlen(getcwd()) + 1 < strlen(l:itemList[2])) 
                let l:file = strpart(l:itemList[2], strlen(getcwd()) + 1)
            else
                let l:file = l:itemList[2]
            endif
            let l:tempStr = join([l:file . ':' . l:itemList[1] . ':' ], "\t")
        elseif l:type == 3 
            continue
        else
            let l:tempStr .= "\t" . trim(item)
        endif

        if (l:type != 1 && l:tempStr != '') 
            call add(l:newcscopeList, l:tempStr)
            let l:tempStr = ''
        endif
    endfor
    if (l:tempStr != '')
        call add(l:newcscopeList, l:tempStr)
        let l:tempStr = ''
    endif
    if (g:fzf_popup_status == 1)
        call fzf#run(fzf#wrap('fzfcscope', fzf#vim#with_preview({'source': l:newcscopeList, 'sink': 'CscopeFind', 'options':["--delimiter=:", '--preview-window', '+{2}-/2']}), 0))
    else
        call fzf#run(fzf#wrap('fzfcscope', {'source': l:newcscopeList, 'sink': 'CscopeFind', 'options':["--delimiter=:", '--preview-window', '+{2}-/2']}, 0))
    endif
endfunction

"command! -nargs=1 -bang CscopeFind call CscopeFind(<q-args>)
"command! -nargs=1 -bang CscopeFindGlobal call CscopeFindGlobal(<q-args>)

function! s:fzf_neighbouring_files()
  let current_file = expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 2'
  call fzf#run(fzf#wrap('fzfneigh', {
        \ 'source': command,
        \ 'options': '-m -x +s',
        \ 'window':  { 'width': 0.8, 'height': 0.6, 'border': 'rounded' } }))
endfunction
command! FZFNeigh call s:fzf_neighbouring_files()

function! FzfGetQuickFixList(cmdstr)
    let l:quickhistory = trim(execute(a:cmdstr))
    let l:newQuickfixHistoryList = []
    if l:quickhistory == "No entries"
        return l:newQuickfixHistoryList
    endif
    let l:quickHistoryList = split(l:quickhistory, "\n")
    if len(l:quickHistoryList) == 0 || l:quickhistory == "No entries"
        echomsg "no quick fix list"
        return l:newQuickfixHistoryList
    endif

    let l:quickHistoryList = reverse(l:quickHistoryList)

    for item in l:quickHistoryList
        let itemInfo = split(item, ";")
        let numsList = split(itemInfo[0], " ")
        let nums = 0
        for subItem in numsList
            if subItem == "of"
                break
            endif
            let nums = subItem
        endfor
        if nums != "" 
            call add(l:newQuickfixHistoryList, nums . ':' . itemInfo[1])
        endif
    endfor

    return l:newQuickfixHistoryList
endfunction

function! s:FzfQuickfixOpen(line)
    if a:line == "" 
        return
    endif
    let lineInfo = split(a:line, ":")
    let nums = lineInfo[0]
    exec nums . "chi"
    copen
endfunction
function! s:FzfQuickfixLocalOpen(line)
    if a:line == "" 
        return
    endif
    let lineInfo = split(a:line, ":")
    let nums = lineInfo[0]
    exec nums . "lhi"
    lopen
endfunction



command! -bang FzfQuiclfixHistory
    \ call fzf#run(fzf#wrap('fzfquickfix', {'source': FzfGetQuickFixList('chi'), 'sink': function('s:FzfQuickfixOpen')}, 0))

command! -bang FzfQuiclfixLocalHistory
    \ call fzf#run(fzf#wrap('fzfquickfix', {'source': FzfGetQuickFixList('lhi'), 'sink': function('s:FzfQuickfixLocalOpen')}, 0))
