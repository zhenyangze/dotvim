Plug 'zhenyangze/ZoomWin'

map <silent><F1> :ZoomWin<cr>
if version > 800 || has("nvim")
tmap <silent><F1> <c-w>:ZoomWin<cr>
endif