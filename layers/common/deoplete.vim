if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern tern-react'  }
    Plug 'zchee/deoplete-go', { 'do': 'make'  }
    Plug 'zchee/deoplete-jedi', { 'do': 'pip install jedi'  }
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install'  }
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_camel_case = 1

    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    
    "nvim-completion-manager{{{
        inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
        inoremap <c-c> <ESC>
        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    "}}}

endif