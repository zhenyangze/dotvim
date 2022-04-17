Plug 'MattesGroeger/vim-bookmarks'
Plug 'zhenyangze/fzf-bookmarks.vim'

let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1


function! g:BMWorkDirFileLocation()
    let filename = 'bookmarks'
    let location = ''
    if isdirectory('.git')
        " Current work dir is git's work tree
        let location = getcwd().'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', '.;')
    endif

    if !isdirectory($HOME . '/.cache/vim-bookmarks/')
       call  mkdir($HOME . '/.cache/vim-bookmarks/', "p", 0700)
    endif
    if len(location) > 0
        return $HOME . '/.cache/vim-bookmarks/' . sha256(location) . '.' . filename
    else
        return $HOME . '/.cache/vim-bookmarks/' . sha256(getcwd()). '.' . filename
    endif
endfunction