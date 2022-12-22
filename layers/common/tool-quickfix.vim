if version >= 900
    Plug 'bfrg/vim-qf-history'

    augroup qf-history
        autocmd!
        autocmd QuickFixCmdPost chistory echo printf('Quickfix %d of %d (%d items): %s',
                    \ getqflist({nr: 0}).nr,
                    \ getqflist({nr: '$'}).nr,
                    \ getqflist({size: 0}).size,
                    \ getqflist({title: 0}).title
                    \ )
        autocmd QuickFixCmdPost lhistory echo printf('Location-list %d of %d (%d items): %s',
                    \ getloclist(0, {nr: 0}).nr,
                    \ getloclist(0, {nr: '$'}).nr,
                    \ getloclist(0, {size: 0}).size,
                    \ getloclist(0, {title: 0}).title
                    \ )
    augroup END

    augroup qf-history
        autocmd!
        autocmd QuickFixCmdPost chistory cwindow
        autocmd QuickFixCmdPost lhistory lwindow
    augroup END
endif
