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

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --no-ignore --smart-case '.shellescape(<q-args>) . ' 2> /dev/null', 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

autocmd VimEnter * command! -bang Colors
            \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* FzfTodo
  \ call fzf#vim#ag('[^\w_\$\''''\>](FIXME|TODO|todo|fixme|Todo|ToDo|toDo):?[^\w_\/\(\'''']',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

command! -bang -nargs=* FzfPHPClass
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "^[\s]*class\s+(\S+)" 2> /dev/null', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%', '?'),
            \   <bang>0
            \ )

command! -bang -nargs=* FzfPHPFunction
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "^[\s]*(private|protected|public)?\s*(static)?\s*function\s+(\S+)" 2> /dev/null', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%', '?'),
            \   <bang>0
            \ )

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '\S*$',
            \ 'source': 'rg -n ^ --color always .',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

function! s:fzfdir(e) 
    exec 'Fern  . -reveal=' . a:e . ' -drawer'
endfunction

command! -bang FzfDirs
            \ call fzf#run(fzf#wrap('fzfdirs', {'source':'find .  -type d  \( ! -iname ".*" \) | sed "s|^\./||g" 2> /dev/null', 'sink': function('<sid>fzfdir')}, 0))

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
              \ call fzf#run(fzf#wrap('RgFiles', {'source':'rg --files --hidden --follow --no-ignore --glob "!.git/*" 2>/dev/null' , 'sink': 'e', 'options': '--reverse --ansi --delimiter / --nth -2..'}, 0))


endif

function! FzfProjectList()
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
            \ call fzf#run(fzf#wrap('FzfChangeFiles', {'source': 'git status --porcelain | sed s/^...//', 'sink': 'e', 'options': ['--layout=reverse', '--info=inline', '--preview','~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, 0))

command! -bang FzfArtisan
    \ call fzf#run(fzf#wrap('fzfartisan', {'source': 'php artisan | grep ":" | awk "{print \$1}"', 'sink': 'fzfAg'}, 0))


function! CscopeFind(line)
    let l:fileName = split(a:line, ':')[2]
    let l:fileLineNum = split(a:line, ':')[1]
    execute 'e ' . l:fileName
    execute ':' . l:fileLineNum
endfunction

function! FzfCscope(option, query)
    let l:output = execute('cs find ' . a:option . ' ' . a:query)
    let l:cscopeList = split(l:output, "\n")
    let l:newcscopeList = []
    let l:nums = -1
    let l:tempStr = ''
    for item in l:cscopeList
        let l:nums += 1 
        if (l:nums <= 1)
            continue
        endif
        let l:tempNum = (l:nums - l:nums % 2) / 2
        if (l:nums % 2) == 0 
            let l:tempStr = join(split(item), ':')
        else 
            let l:tempStr .= item
        endif

        if (l:nums % 2) == 1
            call add(l:newcscopeList, l:tempStr)
            let l:tempStr = ''
        endif
    endfor
    call fzf#run(fzf#wrap('fzfcscope', {'source': l:newcscopeList, 'sink': 'CscopeFind'}, 0))
endfunction

command! -nargs=1 -bang CscopeFind call CscopeFind(<q-args>)

function! s:fzf_neighbouring_files()
  let current_file = expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 2'
  call fzf#run(fzf#wrap('fzfneigh', {
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  { 'width': 0.8, 'height': 0.6, 'border': 'rounded' } }))
endfunction
command! FZFNeigh call s:fzf_neighbouring_files()
