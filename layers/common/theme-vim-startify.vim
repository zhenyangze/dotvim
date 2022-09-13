Plug 'mhinz/vim-startify'
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ 'bundle/.*/doc',
            \ '\.DS_Store',
            \ '.*\.so',
            \ '.*\.rdb',
            \ '.*/\.git/*'
            \ ]

let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

let g:startify_files_number = 8
let g:NERDTreeHijackNetrw = 0
let g:startify_session_autoload = 1
let g:startify_session_dir = '~/.vim/session'

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitRecent()
    let files = systemlist('git log -m -5 --name-only --pretty="format:"  HEAD | grep  "\S" | head -16 | sort | uniq')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:gitModified'),  'header': ['   Git Modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   Git Untracked']},
        \ { 'type': function('s:gitRecent'),    'header': ['   Git Recent'] },
        \ { 'type': 'dir',       'header': ['   📂 Dirs'] },
        \ { 'type': 'files',     'header': ['   📔 Files']            },
        \ { 'type': 'sessions',  'header': ['   📦 Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   🔖 Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]