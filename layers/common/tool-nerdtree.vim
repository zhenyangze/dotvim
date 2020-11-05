""Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTree', 'NERDTreeClose']}
""Plug 'jistr/vim-nerdtree-tabs' ", { 'on': 'NERDTreeTabsToggle'  }
""Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTree', 'NERDTreeClose']}

"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	"exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	"exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction
"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:NERDTreeMapToggleFilters='&'

""jistr/vim-nerdtree-tabs{{{
    "let NERDTreeShowLineNumbers=0
    "let NERDTreeAutoCenter=1
	"" 是否显示隐藏文件
    "let NERDTreeShowHidden=1
    "let NERDTreeShowBookmarks=1
    "let g:NERDTreeWinSize=30
    "let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    "let NERDTreeChDirMode=2
    "let NERDTreeQuitOnOpen=0
    "let NERDTreeMouseMode=2
    "let NERDTreeShowHidden=1
    "let NERDTreeKeepTreeInNewTab=1
    "let g:NERDTreeUpdateOnWrite = 0
    "let g:nerdtree_tabs_open_on_gui_startup=0
    "let g:NERDTreeShowIgnoredStatus = 1

    ""}}}
    ""nerdtree-git-plugin{{{
    "let g:NERDTreeIndicatorMapCustom = {
                "\ "Modified"  : "✹",
                "\ "Staged"    : "✚",
                "\ "Untracked" : "✭",
                "\ "Renamed"   : "➜",
                "\ "Unmerged"  : "═",
                "\ "Deleted"   : "✖",
                "\ "Dirty"     : "✗",
                "\ "Clean"     : "✔︎",
                "\ "Unknown"   : "?"
                "\ }
    ""}}}
    ""{{{
    "" Check if NERDTree is open or active
    "function! IsNERDTreeOpen()        
        "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    "endfunction

"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! SyncTree()
    "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        "NERDTreeFind
        ""NERDTreeTabsFind
        "wincmd p
    "endif
"endfunction

"" Highlight currently open buffer in NERDTree
""autocmd BufWinEnter * call SyncTree()
""}}}
"" let g:NERDTreeWinPos = "right"
