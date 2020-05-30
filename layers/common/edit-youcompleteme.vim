if 0
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --omnisharp-completer --system-libclang --system-boost', 'on': []}

    "youcomplete"{{{
    augroup load_us_ycm
        autocmd!
        autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                    \| autocmd! load_us_ycm
    augroup END
    " YouCompleteMe
    "autocmd FileType php setlocal omnifunc=phpcomplete#Complete
    set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
    "开启基于tag的补全，可以在这之后添加需要的标签路径  
    let g:ycm_collect_identifiers_from_tags_files = 1  
    "开启语义补全  
    let g:ycm_seed_identifiers_with_syntax = 1  
    "在接受补全后不分裂出一个窗口显示接受的项  
    set completeopt-=preview  
    "不显示开启vim时检查ycm_extra_conf文件的信息  
    "let g:ycm_confirm_extra_conf=0  
    "每次重新生成匹配项，禁止缓存匹配项  
    let g:ycm_cache_omnifunc=1
    "在注释中也可以补全  
    let g:ycm_complete_in_comments=1
    let g:ycm_key_detailed_diagnostics=""
    " 从第一个键入字符就开始罗列匹配项
    let g:ycm_min_num_of_chars_for_completion=1
    let g:ycm_semantic_triggers =  {
                \   'c' : ['->', '.'],
                \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                \             're!\[.*\]\s'],
                \   'ocaml' : ['.', '#'],
                \   'cpp,objcpp' : ['->', '.', '::'],
                \   'perl' : ['->'],
                \   'php' : ['->'],
                \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
                \   'ruby' : ['.', '::'],
                \   'lua' : ['.', ':'],
                \   'erlang' : [':'],
                \ }
    let g:ycm_filetype_blacklist = {
                \ 'tagbar' : 1,
                \ 'qf' : 1,
                \ 'notes' : 1,
                \ 'markdown' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'vimwiki' : 1,
                \ 'gitcommit' : 1,
                \}
    nnoremap <leader>gl :YcmCompleterGoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleterGoToDefinition<CR>
    nnoremap <leader>gt :YcmCompleterGoToDefinitionElseDeclaration<CR>
    " autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

    " YCM和Ultisnips按键冲突解决方案
    function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
            if pumvisible()
                return "\<C-n>"
            else
                call UltiSnips#JumpForwards()
                if g:ulti_jump_forwards_res == 0
                    return "\<TAB>"
                endif
            endif
        endif
        return ""
    endfunction

    function! g:UltiSnips_Reverse()
        call UltiSnips#JumpBackwards()
        if g:ulti_jump_backwards_res == 0
            return "\<C-P>"
        endif

        return ""
    endfunction

    if !exists("g:UltiSnipsJumpForwardTrigger")
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
    endif
    if !exists("g:UltiSnipsJumpBackwardTrigger")
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    endif

    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
    "}}}
endif
