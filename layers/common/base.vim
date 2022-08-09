" syntax
syn on " 语法支持

" encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936,unicode
set termencoding=utf-8
set formatoptions+=m
set formatoptions+=B
set fileformats=unix,dos,mac
set noshowmode
"set fileformats+=dos
"set binary " VIM Disable Automatic Newline At End Of File
set path+=**

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

set noeol
if version > 740
    set nofixeol
endif
if has('win32')
    set ffs=dos,unix,mac
"elseif has('mac')
    "set ffs=mac,unix,dos
    "set fileformat=mac
"elseif has('unix')
else
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
set smartindent "智能缩进

" line
set number "显示行号
augroup relative_numbser
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END
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
set foldmethod=indent
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
set cmdheight=1

" leader
let mapleader = "\<Space>"  " 这个leader就映射为逗号
let g:mapleader = "\<Space>"


" window
set splitright
set splitbelow

" autocmd
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType php set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType html set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType blade set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd FileType vue set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd Filetype gitcommit setlocal spell textwidth=80
"autocmd FileType php setlocal noeol binary fileformat=dos
"autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %
au BufWinEnter * if &buftype == 'terminal' | setlocal bufhidden=hide | endif

" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项

" 搜索扩展
function! s:getSelectedText()
  let l:old_reg = getreg('"')
  let l:old_regtype = getregtype('"')
  norm gvy
  let l:ret = getreg('"')
  call setreg('"', l:old_reg, l:old_regtype)
  exe "norm \<Esc>"
  return l:ret
endfunction

vnoremap <silent> * :call setreg("/",
    \ substitute(<SID>getSelectedText(),
    \ '\_s\+',
    \ '\\_s\\+', 'g')
    \ )<Cr>n

vnoremap <silent> # :call setreg("?",
    \ substitute(<SID>getSelectedText(),
    \ '\_s\+',
    \ '\\_s\\+', 'g')
    \ )<Cr>n

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
    if !has('nvim')
        set noantialias
    endif
    set linespace=1
    set guicursor=n-v-c:ver10
    set scrolloff=0
    set mouse=a
end
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_winsize=20
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

if !exists("g:plug_threads")
    vnoremap < <gv
    vnoremap > >gv
    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j
    nnoremap Q :qall!<CR>
    command! W w !sudo tee % > /dev/null
    nnoremap <C-p> <C-i>
    nnoremap <tab> %
    vnoremap <tab> %
    nnoremap ; :
    vnoremap ; :

    nmap ,a gg0vG$<CR>
    nmap ,d :Lexplore<CR>
    nmap ,0 :only<CR>
    nmap ,f :find<space>
    nmap ,s :Lexplore<CR>
    nmap ,n :tabnew<CR>
    nmap ,b :b<space>
    nmap ,g :vimgrep<space>*<space>**/*
    nmap ,q :q!<CR>
    nmap ,w :w!<CR>

    nmap <space>1 :tabn 1<CR>
    nmap <space>2 :tabn 2<CR>
    nmap <space>3 :tabn 3<CR>
    nmap <space>4 :tabn 4<CR>
    nmap <space>5 :tabn 5<CR>

    set complete-=i
    set omnifunc=syntaxcomplete#Complete

    function! Smart_TabComplete()
        let line = getline('.')                         " current line
        let substr = strpart(line, -1, col('.')+1)      " from the start of the current
        " line to one character right
        " of the cursor
        let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
        if (strlen(substr)==0)                          " nothing to match on empty string
            return "\<tab>"
        endif
        let has_period = match(substr, '\.') != -1      " position of period, if any
        let has_slash = match(substr, '\/') != -1       " position of slash, if any
        if pumvisible()
            return "\<C-N>"                         " existing text matching
        elseif (!has_period && !has_slash)
            return "\<C-X>\<C-P>"                         " existing text matching
        elseif ( has_slash )
            return "\<C-X>\<C-F>"                         " file matching
        else
            return "\<C-X>\<C-O>"                         " plugin matching
        endif
    endfunction

    inoremap <tab> <c-r>=Smart_TabComplete()<CR>
endif
