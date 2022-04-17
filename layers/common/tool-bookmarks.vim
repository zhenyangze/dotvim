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


let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()