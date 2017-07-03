" syntax
syn on " 语法支持

" encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936
set termencoding=utf-8
set formatoptions+=m
set formatoptions+=B
"set fileformats+=dos
"set binary " VIM Disable Automatic Newline At End Of File
set noeol
set nofixeol
if has('win32')
    set ffs=dos,unix,mac
elseif has('mac')
    set ffs=mac,unix,dos
    set fileformat=mac
elseif has('unix')
    set ffs=unix,dos,mac
    set ff=unix
endif


set laststatus=2 "始终显示状态栏
set tabstop=4 "一个制表符的长度
set softtabstop=4 "一个制表符的长度（可以大于tabstop）
set shiftwidth=4 "一个缩进的长度
set expandtab "使用空格替代制表符
set smarttab "智能制表符
set autoindent "自动缩进
set smartindent "只能缩进

" line
set number "显示行号
set relativenumber "显示相对行号
set cursorline " 显示当前行
set ruler "显示位置指示器

" backup
set backupdir=/tmp "设置备份文件目录
set directory=/tmp "设置临时文件目录

" search
set ignorecase "检索时忽略大小写
set hls "检索时高亮显示匹配项
set incsearch "边搜索边显示

" help
set helplang=cn "帮助系统设置为中文
set shortmess=atI "启动的时候不显示那个援助索马里儿童的提示`

" fold
set foldlevel=999   " 启动vim时不要自动折叠代码
set showmatch " 高亮显示匹配的括号 
set wrap
set foldmethod=marker
"1. manual //手工定义折叠
"2. indent //用缩进表示折叠
"3. expr　 //用表达式来定义折叠
"4. syntax //用语法高亮来定义折叠
"5. diff   //对没有更改的文本进行折叠
"6. marker //用标志折叠
set lazyredraw "延迟
set ttyfast

" cursor
set wildmode=list:longest "命令行提示
set scrolloff=30 "光标在中间
set backspace=indent,eol,start
set hidden " 离开缓存时不保存"
set novisualbell "关闭可视化响铃"
set visualbell t_vb=  "关闭visual bell
au GuiEnter * set t_vb= "关闭beep
set noerrorbells " don't beep"
set visualbell t_vb=
set showcmd "显示指令输入"
set history=2000
set mouse=

" leader
let mapleader = "\<Space>"  " 这个leader就映射为逗号
let g:mapleader = "\<Space>"

" theme
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    " 禁止显示滚动条
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guicursor=i:ver1
end
syntax enable
set background=dark
  " colorscheme molokai
  " colorscheme spacegray
  " colorscheme onedark
" colorscheme space-vim-dark

" window
set splitright
set splitbelow

" autocmd
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd Filetype gitcommit setlocal spell textwidth=80
"autocmd FileType php setlocal noeol binary fileformat=dos
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.php exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func! SetTitle()
    if &filetype == 'php'
        call setline(1, "<?php")
    endif
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: zhenyangze")
        call append(line(".")+2, "\# mail: zhenyangze@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "")
    else
        if &filetype == 'php'
            call append(line("."), "/**")
            call append(line(".")+1, "* @file ".expand("%"))
            call append(line(".")+2, "* ")
            call append(line(".")+3, "* @author zhenyangze")
            call append(line(".")+4, "* @mail   zhenyangze@gmail.com ")
            call append(line(".")+5, "* @time   ".strftime("%c"))
            call append(line(".")+6, "*/")
            call append(line(".")+7, "")
       else 
            call setline(1, "/**")
            call append(line("."), "* File Name: ".expand("%"))
            call append(line(".")+1, "* Author: zhenyangze")
            call append(line(".")+2, "* Mail: zhenyangze@gmail.com ")
            call append(line(".")+3, "* Created Time: ".strftime("%c"))
            call append(line(".")+4, "*/")
            call append(line(".")+5, "")
        endif
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
