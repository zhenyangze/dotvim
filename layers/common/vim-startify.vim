Plug 'zhenyangze/vim-startify'
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ 'bundle/.*/doc',
            \ '\.DS_Store',
            \ '.*\.so',
            \ '.*\.rdb',
            \ '.*/\.git/*'
            \ ]
let g:startify_bookmarks = [
            \ $HOME . "/.vimrc", $HOME . "/.vimrc.first",
            \ $HOME . "/.vimrc.last", $HOME . "/.vimrc.plugins"
            \ ] 

let g:startify_files_number = 8
let g:startify_list_order = [
            \ ['   ✅ Projects'],
            \ 'projects',
            \ ['   📂 Dirs'],
            \ 'dir',
            \ ['   📔 Files'],
            \ 'files',
            \ ['   📦 Sessions'],
            \ 'sessions',
            \ ['   🔖 Bookmarks'],
            \ 'bookmarks',
            \ ['   commands'],
            \ 'commands',
            \ ]
let g:NERDTreeHijackNetrw = 0
let g:startify_session_autoload = 1

let g:startify_nerdtree_bookmark_file = '~/.NERDTreeBookmarks'