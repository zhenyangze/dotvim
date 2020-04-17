Plug 'vim-scripts/YankRing.vim'
"将yankring的历史文件夹移到~/.vim
if (has('unix')) 
    let g:yankring_history_dir = '/tmp'
endif
"修改历史文件名
"let g:yankring_history_file = '.yankring_history'
"<leader>m选择上一个复制的文本
let g:yankring_replace_n_pkey = '<Leader>eyn'
"<leader>n选择下一个复制的文本
let g:yankring_replace_n_nkey = '<Leader>eym'
"<leader>y显示yankring中的内容
"nmap <Leader>ys :YRShow<CR>