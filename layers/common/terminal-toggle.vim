if version > 800 || has("nvim")
Plug 'PangPangPangPangPang/vim-terminal'

map <silent> <F2> :VSTerminalToggle<cr>

if has("nvim")
    tmap <silent> <F2> <C-\><C-n>:VSTerminalToggle<cr>
    tmap <silent><Leader>tt <C-\><C-n>:VSTerminalToggle<cr>
    tmap <silent><Leader>to <C-\><C-n>:call TerminalOpenWithIndex()<cr>
    tmap <silent><Leader>td <C-\><C-n>:call TerminalDeleteWithIndex()<cr>
    tmap <silent><Leader>tc <C-\><C-n>:VSTerminalOpenNew<cr>
    tmap <silent><Leader>t1 <C-\><C-n>:call TerminalOpenIndex(1)<cr>
    tmap <silent><Leader>t2 <C-\><C-n>:call TerminalOpenIndex(2)<cr>
    tmap <silent><Leader>t3 <C-\><C-n>:call TerminalOpenIndex(3)<cr>
    tmap <silent><Leader>t4 <C-\><C-n>:call TerminalOpenIndex(4)<cr>
    tmap <silent><Leader>t5 <C-\><C-n>:call TerminalOpenIndex(5)<cr>
else
    tmap <silent> <F2> <c-w>:VSTerminalToggle<cr>
    tmap <silent><Leader>tt <c-w>:VSTerminalToggle<cr>
    tmap <silent><Leader>to <c-w>:call TerminalOpenWithIndex()<cr>
    tmap <silent><Leader>td <c-w>:call TerminalDeleteWithIndex()<cr>
    tmap <silent><Leader>tc <c-w>:VSTerminalOpenNew<cr>
    tmap <silent><Leader>t1 <c-w>:call TerminalOpenIndex(1)<cr>
    tmap <silent><Leader>t2 <c-w>:call TerminalOpenIndex(2)<cr>
    tmap <silent><Leader>t3 <c-w>:call TerminalOpenIndex(3)<cr>
    tmap <silent><Leader>t4 <c-w>:call TerminalOpenIndex(4)<cr>
    tmap <silent><Leader>t5 <c-w>:call TerminalOpenIndex(5)<cr>
endif

"Tab management with :VSTerminalOpenNew, :VSTerminalOpenWithIndex, :VSTerminalDeleteWithIndex

function! TerminalOpenWithIndex()
    let l:index = input("Terminal Index: ")
    if l:index > 0
        exec("VSTerminalOpenWithIndex " . l:index)
    endif
endfunction

function! TerminalOpenIndex(index)
    if a:index > 0
        exec("VSTerminalOpenWithIndex " . a:index)
    endif
endfunction

function! TerminalDeleteWithIndex()
    let l:index = input("Terminal Index: ")
    if l:index > 0
        exec("VSTerminalDeleteWithIndex " . l:index)
    endif
endfunction

if !has("nvim")
    au TerminalOpen * if &buftype == 'terminal' | setlocal bufhidden=hide | endif
endif
autocmd bufenter * if (winnr("$") == 1 && exists('b:rootDir') && &buftype == 'terminal') | q! | endif
endif