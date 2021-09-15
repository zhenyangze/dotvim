"lang action{{{
function! GoRenameLocalVariable()
    exec 'GoRename'
endfunction

function! GoRenameClassVariable()
    exec 'GoRename'
endfunction

function! GoRenameMethod()
    exec 'GoRename'
endfunction

function! GoExtractExpression()
endfunction

function! GoClassExpand()
endfunction

function! GoExtractConst()
endfunction

function! GoExtractUse()
endfunction

function! GoExtractClassProperty()
endfunction

function! GoExtractMethod()
endfunction

function! GoClassNew()
endfunction

function! GoClassInflect()
endfunction

function! GoChangeVisibility()
endfunction

function! GoGenerateAccessors()
endfunction

function! GoCreateSettersAndGetters()
endfunction

function! GoCreateGetters()
endfunction

function! GoImportClass()
    exec 'GoImports'
endfunction

function! GoImportMissingClasses()
    exec 'GoImports'
endfunction

function! GoGotoDefinition()
    exec 'GoDef'
endfunction
function! GoGotoImplementations()
    exec 'GoImplements'
endfunction
function! GoFindReferences()
    exec 'GoReferrers'
endfunction
function! GoDocAll()
endfunction
function! GoUnitSwitchFile()
endfunction
function! GoTransform()
endfunction
function! GoHover()
    exec 'GoDoc'
endfunction
function! GoContextMenu()
endfunction
