Plug 'zhenyangze/VOoM'
let g:voom_ft_modes = {'markdown': 'markdown', 'c': 'fmr2', 'cpp': 'fmr2', 'markdown.mkd': 'markdown', 'tex': 'latex', 'php': 'php'}
autocmd bufenter * if (winnr("$") == 1 && &filetype == 'voomtree') | q | endif