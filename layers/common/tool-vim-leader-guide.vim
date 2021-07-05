"Plug 'zhenyangze/vim-leader-guide'
Plug 'liuchengxu/vim-which-key'

if version > 800 || has("nvim")
let g:which_key_use_floating_win = 1
endif
highlight default link WhichKeyFloating Pmenu
highlight default link WhichKey          Function
highlight default link WhichKeySeperator Keyword
highlight default link WhichKeyGroup     Keyword
highlight default link WhichKeyDesc      Identifier