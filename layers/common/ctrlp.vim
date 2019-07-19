if 1 == 2
    Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'

    if has('win')
        set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    else 
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    endif

    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                \ 'file': '\v\.(exe|so|dll)$',
                \ 'link': 'some_bad_symbolic_links'
                \ }
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_reuse_window  = 'startify\|netrw'
endif