function! RunDox()
    "call <SNR>85_DoxygenCommentFunc()
    redir => s:tempList
    silent! exec 'fu /DoxygenCommentFunc$'
    redir END
    
    let s:result = split(s:tempList)
    let s:funcName = s:result[1]
    if (len(s:funcName) < 10)
        return
    endif
    "let s:funcName = substitute(s:funcName, '(', "", "")
    "let s:funcName = substitute(s:funcName, ')', "", "")
    silent! exec 'call ' . s:funcName
endfunction


"let g:vim_php_refactoring_phpdoc = '<SNR>85_DoxygenCommentFunc'
let g:vim_php_refactoring_phpdoc = 'RunDox'
" phpmd {{{
" https://www.kancloud.cn/bajiao/phpmd/128478
"let g:ale_php_phpmd_ruleset = get(g:, 'ale_php_phpmd_ruleset', 'cleancode,codesize,controversial,design,naming,unusedcode')
let g:ale_php_phpmd_ruleset = "unusedcode"
" }}}


"lang action{{{
function! PhpRenameLocalVariable()
    call PhpRenameLocalVariable()
endfunction

function! PhpRenameClassVariable()
    call PhpRenameClassVariable()
endfunction

function! PhpRenameMethod()
    call PhpRenameMethod()
endfunction

function! PhpExtractExpression()
    exec 'PhpactorExtractExpression'
endfunction

function! PhpClassExpand()
    exec 'PhpactorClassExpand'
endfunction

function! PhpExtractConst()
    call PhpExtractConst()
endfunction

function! PhpExtractUse()
    call PhpExtractUse()
endfunction

function! PhpExtractClassProperty()
    call PhpExtractClassProperty()
endfunction

function! PhpExtractMethod()
    call PhpExtractMethod()
endfunction

function! PhpClassNew()
    exec 'PhpactorClassNew'
endfunction

function! PhpClassInflect()
    exec 'PhpactorClassInflect'
endfunction

function! PhpChangeVisibility()
    exec 'PhpactorChangeVisibility'
endfunction

function! PhpGenerateAccessors()
    exec 'PhpactorGenerateAccessors'
endfunction

function! PhpCreateSettersAndGetters()
    call PhpCreateSettersAndGetters()
endfunction

function! PhpCreateGetters()
    call PhpCreateGetters()
endfunction

function! PhpImportClass()
    exec 'PhpactorImportClass'
endfunction

function! PhpImportMissingClasses()
    exec 'PhpactorImportMissingClasses'
endfunction

function! PhpGotoDefinition()
    exec 'PhpactorGotoDefinition'
endfunction
function! PhpGotoImplementations()
    exec 'PhpactorGotoImplementations'
endfunction
function! PhpFindReferences()
    exec 'PhpactorFindReferences'
endfunction
function! PhpDocAll()
    call PhpDocAll()
endfunction
function! PhpUnitSwitchFile()
    let f = expand('%')
    let cmd = ''
    let is_test = expand('%:t') =~ "Test\."
    "exec 'Rooter'
    let rpwd = getcwd()
    if is_test
        " remove phpunit_testroot
        let f = substitute(f,'^'.rpwd.'/tests/','','')
        " remove 'Test.' from filename
        let f = substitute(f,'Test\.','.','')
        let cmd = 'to '
    else
        let f = rpwd . "/tests/" . expand('%:r') . "Test.php"
        let cmd = 'bo '
    endif
    " is there window with complent file open?
    let win = bufwinnr(f)
    if win > 0
        execute win . "wincmd w"
    else
        execute cmd . "vsplit " . f
    endif

endfunction
function! PhpTransform()
    call phpactor#Transform()
endfunction
function! PhpHover()
    exec 'PhpactorHover'
endfunction
function! PhpContextMenu()
    exec 'PhpactorContextMenu'
endfunction


"}}}