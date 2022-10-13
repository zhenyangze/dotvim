if version > 800 || has("nvim")
Plug 'PangPangPangPangPang/vim-terminal'

map <silent> <Leader>tt :VSTerminalToggle<cr>

if has("nvim")
    tmap <silent> <F2> <C-\><C-n>:VSTerminalToggle<cr>
    tmap <silent><Leader>tt <C-\><C-n>:VSTerminalToggle<cr>
    tmap <silent><Leader>to <C-\><C-n>:call TerminalOpenWithIndex()<cr>
    tmap <silent><Leader>td <C-\><C-n>:call TerminalDeleteWithIndex()<cr>
    tmap <silent><Leader>tn <C-\><C-n>:VSTerminalOpenNew<cr>
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
    tmap <silent><Leader>tn <c-w>:VSTerminalOpenNew<cr>
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

fun! RemapTerminalEsc()
    if has("nvim")
        if &ft =~ 'fzf' || &ft =~ 'floaterm'
            silent! tunmap <buffer> <Esc>
        else
            au TermOpen * set ft=terminal
            au FileType terminal  tnoremap <Esc> <C-\><C-n>   "tnoremap stands for terminal mode mappings in neovim"
            au FileType terminal  tnoremap <buffer> <silent> <c-h> <C-\><C-N><C-w>h
            au FileType terminal  tnoremap <buffer> <silent> <c-j> <C-\><C-N><C-w>j
            au FileType terminal  tnoremap <buffer> <silent> <c-k> <C-\><C-N><C-w>k
            au FileType terminal  tnoremap <buffer> <silent> <c-j> <C-\><C-N><C-w>j
        endif
    endif
endfun

augroup vimrc
    autocmd!
    autocmd BufEnter * silent! call RemapTerminalEsc()
augroup END