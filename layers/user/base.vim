autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.php,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func! SetTitle()
    if &filetype == 'php'
        call setline(1, "<?php")
        call append(line("."), "/**")
        call append(line(".")+1, "* @file ".expand("%"))
        call append(line(".")+2, "* ")
        call append(line(".")+3, "* @author zhenyangze")
        call append(line(".")+4, "* @mail   zhenyangze@gmail.com ")
        call append(line(".")+5, "* @time   ".strftime("%c"))
        call append(line(".")+6, "*/")
        call append(line(".")+7, "")
    endif
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: zhenyangze")
        call append(line(".")+2, "\# mail: zhenyangze@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "")
    endif
    if &filetype == 'cpp'
        call setline(1, "/**")
        call append(line("."), "* File Name: ".expand("%"))
        call append(line(".")+1, "* Author: zhenyangze")
        call append(line(".")+2, "* Mail: zhenyangze@gmail.com ")
        call append(line(".")+3, "* Created Time: ".strftime("%c"))
        call append(line(".")+4, "*/")
        call append(line(".")+5, "")

        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call setline(1, "/**")
        call append(line("."), "* File Name: ".expand("%"))
        call append(line(".")+1, "* Author: zhenyangze")
        call append(line(".")+2, "* Mail: zhenyangze@gmail.com ")
        call append(line(".")+3, "* Created Time: ".strftime("%c"))
        call append(line(".")+4, "*/")
        call append(line(".")+5, "")
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(line("."), '# -*- coding: utf-8 -*-')
        call append(line(".")+1, "# Author: zhenyangze")
        call append(line(".")+2, "# Mail: zhenyangze@gmail.com")
        call append(line(".")+3, "# Time: " . strftime("%c"))
        call append(line(".")+4, "")
    endif
    "新建文件后，自动定位到文件末尾
    "autocmd BufNewFile * normal G
    let pos = line("$")
    call setpos(".", [0, pos, 0, 0])
endfunc
