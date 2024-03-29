if has("nvim")
    "let g:tagbar_phpctags_bin='/usr/bin/ctags'

    Plug 'liuchengxu/vista.vim'
    " brew install --with-jansson universal-ctags/universal-ctags/universal-ctags
    " sudo apt-get install libjansson-dev

    function! NearestMethodOrFunction() abort
        return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

    " How each level is indented and what to prepend.
    " This could make the display more compact or more spacious.
    " e.g., more compact: ["▸ ", ""]
    " Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

    " Executive used when opening vista sidebar without specifying it.
    " See all the avaliable executives via `:echo g:vista#executives`.
    let g:vista_default_executive = 'ctags'

    " Set the executive for some filetypes explicitly. Use the explicit executive
    " instead of the default one for these filetypes when using `:Vista` without
    " specifying the executive.
    let g:vista_executive_for = {
                \ 'cpp': 'coc',
                \ 'php': 'coc',
                \ }

    " Declare the command including the executable and options used to generate ctags output
    " for some certain filetypes.The file path will be appened to your custom command.
    " For example:
    let g:vista_ctags_cmd = {
                \ 'haskell': 'hasktags -x -o - -c',
                \ }

    " To enable fzf's preview window set g:vista_fzf_preview.
    " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
    " For example:
    let g:vista_fzf_preview = ['right:50%']
    " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
    let g:vista#renderer#enable_icon = 1

    " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
    "let g:vista#renderer#icons = {
                "\   "function": "\uf794",
                "\   "variable": "\uf71b",
                "\  }

    let g:vista_sidebar_position="vertical botright"
    autocmd BufEnter * if (winnr("$") == 1 && vista#sidebar#IsOpen()) | q | endif
else
    Plug 'preservim/tagbar', {'on': 'TagbarToggle' }
    let g:tagbar_type_php  = {
                \ 'ctagstype' : 'php',
                \ 'kinds'     : [
                \ 'n:namespaces',
                \ 'i:interfaces',
                \ 'c:classes',
                \ 'd:constant definitions',
                \ 'f:functions',
                \ 'j:javascript functions:1'
                \]
                \}

    let g:tagbar_type_javascript = {
                \ 'ctagstype': 'javascript',
                \ 'kinds': [
                \ 'A:arrays',
                \ 'P:properties',
                \ 'T:tags',
                \ 'O:objects',
                \ 'G:generator functions',
                \ 'F:functions',
                \ 'C:constructors/classes',
                \ 'M:methods',
                \ 'V:variables',
                \ 'I:imports',
                \ 'E:exports',
                \ 'S:styled components'
                \ ]}


    let g:tagbar_type_json = {
                \ 'ctagstype' : 'json',
                \ 'kinds' : [
                \ 'o:objects',
                \ 'a:arrays',
                \ 'n:numbers',
                \ 's:strings',
                \ 'b:booleans',
                \ 'z:nulls'
                \ ],
                \ 'sro' : '.',
                \ 'scope2kind': {
                \ 'object': 'o',
                \ 'array': 'a',
                \ 'number': 'n',
                \ 'string': 's',
                \ 'boolean': 'b',
                \ 'null': 'z'
                \ },
                \ 'kind2scope': {
                \ 'o': 'object',
                \ 'a': 'array',
                \ 'n': 'number',
                \ 's': 'string',
                \ 'b': 'boolean',
                \ 'z': 'null'
                \ },
                \ 'sort' : 0
                \ }

    let g:tagbar_type_markdown = {
                \ 'ctagstype' : 'markdown',
                \ 'kinds' : [
                \ 'h:Heading_L1',
                \ 'i:Heading_L2',
                \ 'k:Heading_L3'
                \ ]
                \ }

    let g:tagbar_type_snippets = {
                \ 'ctagstype' : 'snippets',
                \ 'kinds' : [
                \ 's:snippets',
                \ ]
                \ }

    let g:tagbar_type_yaml = {
                \ 'ctagstype' : 'yaml',
                \ 'kinds' : [
                \ 'a:anchors',
                \ 's:section',
                \ 'e:entry'
                \ ],
                \ 'sro' : '.',
                \ 'scope2kind': {
                \ 'section': 's',
                \ 'entry': 'e'
                \ },
                \ 'kind2scope': {
                \ 's': 'section',
                \ 'e': 'entry'
                \ },
                \ 'sort' : 0
                \ }

    let g:tagbar_type_css = {
                \ 'ctagstype' : 'Css',
                \ 'kinds'     : [
                \ 'c:classes',
                \ 's:selectors',
                \ 'i:identities'
                \ ]
                \ }

    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }

    let g:tagbar_type_rust = {
                \ 'ctagstype' : 'rust',
                \ 'kinds' : [
                \'T:types,type definitions',
                \'f:functions,function definitions',
                \'g:enum,enumeration names',
                \'s:structure names',
                \'m:modules,module names',
                \'c:consts,static constants',
                \'t:traits',
                \'i:impls,trait implementations',
                \]
                \}

    let g:tagbar_type_typescript = {
                \ 'ctagstype': 'typescript',
                \ 'kinds': [
                \ 'c:classes',
                \ 'n:modules',
                \ 'f:functions',
                \ 'v:variables',
                \ 'v:varlambdas',
                \ 'm:members',
                \ 'i:interfaces',
                \ 'e:enums',
                \ ]
                \ }

    let g:tagbar_type_snippets = {
                \ 'ctagstype' : 'snippets',
                \ 'kinds' : [
                \ 's:snippets',
                \ ]
                \ }

    let g:tagbar_type_yaml = {
                \ 'ctagstype' : 'yaml',
                \ 'kinds' : [
                \ 'a:anchors',
                \ 's:section',
                \ 'e:entry'
                \ ],
                \ 'sro' : '.',
                \ 'scope2kind': {
                \ 'section': 's',
                \ 'entry': 'e'
                \ },
                \ 'kind2scope': {
                \ 's': 'section',
                \ 'e': 'entry'
                \ },
                \ 'sort' : 0
                \ }

    let g:tagbar_type_vue = {
                \ 'ctagstype' : 'vue',
                \ 'kinds'     : [
                \ 'v:variables:variables',
                \ 'f:filters:filters',
                \ 'd:directives:directives',
                \ 'm:methods:methods',
                \ 'p:props:props',
                \ 'c:components:components'
                \ ],
                \ }

    let g:tagbar_map_closefold = ''
endif
