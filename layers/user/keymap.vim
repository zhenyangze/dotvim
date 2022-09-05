" leader
let g:mapleader = "\<Space>"
let g:maplocalleader = ","
set timeoutlen=300

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

" @ keymap
" -----------------------------------------------------------------------------
vnoremap < <gv
vnoremap > >gv
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap Q :qall!<CR>
command! W w !sudo tee % > /dev/null
noremap H ^
noremap L g_

"屏蔽掉讨厌的F1键
"inoremap <F1> <ESC>
"nnoremap <F1> <ESC>
"vnoremap <F1> <ESC>

"使用tab键来代替%进行匹配跳转
nnoremap <C-p> <C-i>
nnoremap <tab> %
vnoremap <tab> %

" 将分号和冒号互换
nnoremap ; :
"nnoremap : ;
vnoremap ; :
"vnoremap : ;
"inoremap jk <ESC>

"nnoremap d "_d
"nnoremap D "_D
"vnoremap d "_d
"vnoremap D "_D

" 交换 ' `, 使得可以快速使用'跳到marked位置
"nnoremap ' `
"nnoremap ` '
"nnoremap ` :call ToggleMouse()<CR>

" @ jump
" -----------------------------------------------------------------------------
"nmap <Leader>jw gg
"nmap <Leader>js GG
"nmap <Leader>ja ^
"nmap <Leader>jd $

map <Leader>ja <Plug>(easymotion-linebackward)
map <Leader>js <Plug>(easymotion-j)
map <Leader>jw <Plug>(easymotion-k)
map <Leader>jd <Plug>(easymotion-lineforward)
nmap <silent> <Leader>jp <Plug>(ale_previous_wrap)
nmap <silent> <Leader>jn <Plug>(ale_next_wrap)
let g:move_key_modifier = 'C'

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
noremap ˙ h
noremap ¬ l
inoremap ˙ <left>
inoremap ¬ <right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转） 
" ctrl+v 再输入Alt+key 
noremap ∆ gj
noremap ˚ gk
inoremap ∆ <c-\><c-o>gj
inoremap ˚ <c-\><c-o>gk

"插入模式下移动
"inoremap <c-j> <down>
"inoremap <c-k> <up>
"inoremap <c-l> <right>
"inoremap <c-h> <left>

nmap f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
nmap F <Plug>(easymotion-overwin-f2)

" @ find
" -----------------------------------------------------------------------------
"nmap <leader>fs <Esc>:AgFile<Space>
"nmap <leader>fa :FzfAg<CR>
"nmap <leader>fb :FzfBuffers<CR>
"nmap <leader>fl :FzfBLines<CR>
"nmap <leader>fg :FzfLines<CR>
"nmap <leader>fd :FzfCommands<CR>
"nmap <leader>ft :FzfBTags<CR>
"nmap <leader>fT :FzfTags<CR>
"nmap <leader>fm :FzfMarks<CR>
"nmap <leader>fp :FzfMaps<CR>
"nmap <leader>fh :FzfHistory<CR>
"LeaderF
"let g:Lf_ShortcutB = '<Leader>fb'
"let g:Lf_ShortcutF = '<Leader>ff'
"nmap <Leader>ff :call ShowfindFiles()<CR>
command! -nargs=1 Find call Find("find . -iname '*'" . shellescape('<args>') . "'*'")
command! -nargs=1 Gfind call Find('git ls-files | grep -E ' . shellescape('<args>'))
command! -nargs=1 Gtfind call Find('git rev-parse --show-toplevel && git ls-files | grep -E ' . shellescape('<args>'))
command! -nargs=1 Locate call Find('locate ' . shellescape('<args>'))
command! -nargs=1 Grep call Find("rg --column --line-number --no-heading --no-ignore --smart-case " . shellescape('<args>'))

"SignatureMap{
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "mda",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]'",
            \ 'GotoPrevLineByPos'  :  "['",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "[+",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListLocalMarks'     :  "ms",
            \ 'ListLocalMarkers'   :  "m?"
            \ }
"}

" @ config
" -----------------------------------------------------------------------------
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '<Leader>zq' 

" @ surround
" -----------------------------------------------------------------------------
let g:surround_no_mappings = 0
if !exists("g:surround_no_mappings") || ! g:surround_no_mappings
    nmap ds  <Plug>Dsurround
    nmap cs  <Plug>Csurround
    nmap ys  <Plug>Ysurround
    nmap yS  <Plug>YSurround
    nmap yss <Plug>Yssurround
    nmap ySs <Plug>YSsurround
    nmap ySS <Plug>YSsurround
    xmap S   <Plug>VSurround
    xmap gS  <Plug>VgSurround
    if !exists("g:surround_no_insert_mappings") || ! g:surround_no_insert_mappings
        if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
            imap    <C-S> <Plug>Isurround
        endif
        imap      <C-G>s <Plug>Isurround
        imap      <C-G>S <Plug>ISurround
    endif
endif
 "Normal mode
 "ds  - delete a surrounding
 "cs  - change a surrounding
 "ys  - add a surrounding
 "yS  - add a surrounding and place the surrounded text on a new line + indent it
 "yss - add a surrounding to the whole line
 "ySs - add a surrounding to the whole line, place it on a new line + indent it
 "ySS - same as ySs
    
 "Visual mode
 "s   - in visual mode, add a surrounding
 "S   - in visual mode, add a surrounding but place text on new line + indent it
    
 "Insert mode
 "<CTRL-s> - in insert mode, add a surrounding
 "<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
 "<CTRL-g>s - same as <CTRL-s>
 "<CTRL-g>S - same as <CTRL-s><CTRL-s>

" @ replace 
"nmap     <Leader>rf <Plug>CtrlSFPrompt
"vmap     <Leader>rf <Plug>CtrlSFVwordPath
"vmap     <Leader>rF <Plug>CtrlSFVwordExec
"nmap     <Leader>rn <Plug>CtrlSFCwordPath
"nmap     <Leader>rp <Plug>CtrlSFPwordPath
"nnoremap <Leader>ro :CtrlSFOpen<CR>
"nnoremap <Leader>rt :CtrlSFToggle<CR>
"inoremap <Leader>rt <Esc>:CtrlSFToggle<CR>

" @ tmux
" -----------------------------------------------------------------------------
if exists('$TMUX')
    colorscheme ron "pablo 调整颜色
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute "wincmd " . a:wincmd
        if previous_winnr == winnr()
            call system("tmux select-pane -" . a:tmuxdir)
            redraw!
        endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif

" leader-guide{{{
let g:which_key_map =  {
            \'0': ['tabonly', 'Close all other tab'],
            \'1': ['JumpToTab(1)', 'No.1'],
            \'2': ['JumpToTab(2)', 'No.2'],
            \'3': ['JumpToTab(3)', 'No.3'],
            \'4': ['JumpToTab(4)', 'No.4'],
            \'5': ['JumpToTab(5)', 'No.5'],
            \'6': ['JumpToTab(6)', 'No.6'],
            \'7': ['JumpToTab(7)', 'No.7'],
            \'8': ['JumpToTab(8)', 'No.8'],
            \'9': ['JumpToTab(9)', 'No.9'],
            \}

let g:which_key_map['['] = {
            \'name': 'Jump Pre',
            \'q': ['cp', 'Pre Quick'],
            \'s': ['ALEPrevious', 'Pre Ale'],
            \'e': [":execute 'move -1-'. v:count1", 'Pre Edit'],
            \'t': ['pop', 'Pre Tag'],
            \'f': ['BesideFile("invert")', 'Pre File in Current Dir'],
            \}

let g:which_key_map[']'] = {
            \'name': 'Jump Next',
            \'q': ['cn', 'Next Quick'],
            \'s': ['ALENext', 'Next Ale'],
            \'e': [":execute 'move +'. v:count1", 'Next Edit'],
            \'t': ['call TagsJumpFunction()', 'Next Tag'],
            \'f': ['BesideFile("")', 'Next File in Current Dir'],
            \}


let g:which_key_map.w = {
            \'name': 'Window',
            \'o': ['only', 'Only'],
            \'q': ['q', 'Quite'],
            \'c': ['q!', 'Close'],
            \'i': ['vs', 'Double'],
            \'|': ['vs', 'Double'],
            \'-': ['split', 'Split'],
            \'v': ['VoomToggle', 'Toggle Outline'],
            \'f': ['NERDTreeToggle', 'Files Tree'],
            \'s': ['FernFindCurrentFile()', 'Find Files'],
            \'t': ['ShowTagbarToggle()', 'TagBarToggle'],
            \'g': ['ShowGunDo()', 'GunDoToggle'],
            \}

let g:which_key_map.t = {
            \'name': 'Terminal && Tab',
            \'1': ['TerminalOpenIndex(1)', 'Open 1st Terminal'],
            \'2': ['TerminalOpenIndex(2)', 'Open 2st Terminal'],
            \'3': ['TerminalOpenIndex(3)', 'Open 3st Terminal'],
            \'4': ['TerminalOpenIndex(4)', 'Open 4st Terminal'],
            \'5': ['TerminalOpenIndex(5)', 'Open 5st Terminal'],
            \'t': ['VSTerminalToggle', 'Terminal Toggle'],
            \'c': ['VSTerminalOpenNew', 'Terminal Open New'],
            \'d': ['TerminalDeleteWithIndex()', 'Terminal Delete With Index'],
            \'o': ['TerminalOpenWithIndex()', 'Terminal Open With Index'],
            \'n': ['tabnew', 'New Tab'],
            \}
let g:which_key_map.b = {
            \'name': 'Buffer',
            \'c': ['bwipeout', 'Clear Current Buffer'],
            \'C': [':%bwipeout', 'Clear All Buffer'],
            \'d': ['bnext', 'Next'],
            \'a': ['bprevious', 'Previous'],
            \'w': ['bfirst', 'First'],
            \'s': ['blast', 'Last'],
            \'n': ['enew', 'New'],
            \'l': ['FzfBuffers', 'List'],
            \}

let g:which_key_map.m = {
            \'name': 'Macro',
            \'q': 'Play',
            \'c': 'Record New',
            \'h': 'History',
            \'a': 'Append',
            \'p': 'Prepend',
            \'o': 'Search And Overwrite',
            \'r': 'Search And Rename',
            \'d': 'Search And Delete',
            \'e': "Search And Play",
            \'s': 'Search And Select',
            \}



vnoremap <leader>ecy "+y"
noremap <leader>ecv ggvG$
noremap <leader>eca :%y<CR>
noremap <leader>ecr :call GetSearchPat()<CR>
let g:which_key_map.e = {
            \'name': 'Edit',
            \'a': {'name': 'Align'},
            \'A': ['AppendText(2)', "Append test to the line end"],
            \'P': ['AppendText(4)', "Append test to the line pre"],
            \'c': {'name': 'Copy'},
            \'f': {
                \'name': 'File',
                \'c': [':exec "let @+=expand(\"%:f\")"', 'Copy File Name With Path'],
                \'f': [':exec "let @+=expand(\"%:t:r:r\")"', 'Copy File Name'],
                \'e': [':exec "let @+=expand(\"%:t\")"', 'Copy File Name With Extension'],
                \'a': [':exec "let @+=expand(\"%:p:h\")"', 'Copy File Absolute Path'],
                \'r': [':exec "let @+=expand(\"%:h\")"', 'Copy File Relative Path'],
                \'p': [':exec "let @+=getcwd()"', 'Copy Root Path'],
                \'l': [':e!', 'Reload File'],
                \},
            \'y': {
                \'name': 'Yank',
                \'l': ['YankHistoryRgPaste', 'Show Yank List']
                \},
            \'m': {
                \'name' : 'Model',
                \'x': [':%!xxd', 'Into Hex Model'],
                \'r': [':%!xxd -r', 'Info Custom Model'],
                \},
            \'t': {
                \'name': 'transform',
                \'a': ['gJ', '参数折叠'],
                \'u': [':set ff=unix', 'Set file to Unix'],
                \'d': [':set ff=dos', 'Set file type to Dos']
                \},
            \'r': {
                \'name': 'Reload',
                \'d': [':e ++ff=dos', 'Open As Dos'],
                \'u': [':e ++ff=unix', 'Open As Unix'],
                \},
            \'s': {
                \'name' : 'Save Encoding',
                \'g': [':set fileencoding=GBK', 'Save as Gbk'],
                \'u': [':set fileencoding=UTF-8', 'Save as Utf-8'],
                \},
            \'i': {
                \'t': ['InitTemplate()', 'Init Template']
                \},
            \'d': {
                \'name' : 'Delete',
                \'a': [':%s#^\+\s*##', 'Delete Start of line Space'],
                \'b': [':set nobomb', 'Delete Bom'],
                \'c': [':%s/^#.*$//g', 'Delete Comment line'],
                \'e': [':%s#\s*\r\?$##', 'Delete End of line Space'],
                \'m': [':%s/\r//g', 'Delete ^M'],
                \'n': [':%s/\n//g', 'Delete \n'],
                \'s': [':g/^\s*$/d', 'Delete Space line'],
                \}
            \}
let g:which_key_map.e.a = "Align"
let g:which_key_map.e.c.a = "Copy All"
let g:which_key_map.e.c.r = "Copy Selection Regular"
let g:which_key_map.e.c.v = "Select All"
map <leader>ep "+gP
let g:which_key_map.e.p = "Paste"

let g:which_key_map.D = {
            \'name': 'Vimspector Debug',
            \'l': ['vimspector#Launch()', 'Launch Debug'],
            \'s': ['vimspector#Stop()', 'Stop Debug'],
            \'b': ['vimspector#ToggleBreakpoint()', 'Toggle Breakpoint'],
            \'c': ['vimspector#ClearBreakpoints()', 'Clear Breakpoint'],
            \'q': ['vimspector#Reset()', 'Quite Debug'],
            \'r': ['vimspector#Continue()', 'Continue Run'],
            \'R': ['vimspector#Restart()', 'Restart Debug'],
            \'i': ['vimspector#StepInto()', 'Step Into'],
            \'o': ['vimspector#StepOut()', 'Step Out'],
            \'n': ['vimspector#StepOver()', 'Step Over'],
            \'p': ['vimspector#Pause()', 'Pause'],
            \'B': ['vimspector#ListBreakpoints()', 'List Breakpoints'],
            \}

let g:which_key_map.d = {
            \'name': 'Debug',
            \'b': 'Breakpoint',
            \'r': 'Run',
            \'h': 'Run To Here',
            \'i': 'Step Into',
            \'o': 'Step Out',
            \'n': 'Step Over',
            \'c': 'Close',
            \'v': 'Content',
            \'e': 'Eval',
            \}

let g:which_key_map.l = {
            \'name': 'Laravel',
            \'A': ['LAdminController', 'Search Controller in Admin'],
            \'C': ['LMConfig', 'Search Config in Module'],
            \'H': ['LMController', 'Search Controller in Module'],
            \'M': ['LMModule', 'Search Module'],
            \'R': ['LMRouter', 'Search Router in Module'],
            \'V': ['LMView', 'Search View in Module'],
            \'c': ['LConfig', 'Search Config'],
            \'e': ['LEvent', 'Search Event'],
            \'l': ['LListener', 'Search Listener'],
            \'m': ['LModel', 'Search Model'],
            \'r': ['LResource', 'Search Resource'],
            \}

let g:which_key_map.p = {
            \'name': 'Program Language',
            \'r': {
            \'name': 'Rename',
            \'V': ['LangRenameLocalVariable()', 'Rename Local Variable'],
            \'v': ['LangRenameClassVariable()', 'Rename Class Variable'],
            \'m': ['LangRenameMethod()', 'Rename Method'],
            \},
            \'e': {
                \'name': 'Extract && Expand',
                \'e': ['LangExtractExpression()', 'Extract Expression'],
                \'f': ['LangClassExpand()', 'Expand Full CLass Name'],
                \'c': ['LangExtractConst()', 'Extract Const'],
                \'u': ['LangExtractUse()', 'Extract Use'],
                \'p': ['LangExtractClassProperty()', 'Extract Property'],
                \'m': ['LangExtractMethod()', 'Extract Method'],
            \},
            \'c': {
                \'name': 'Create && Content && Change',
                \'c': ['LangClassNew()', 'Create New Class'],
                \'i': ['LangClassInflect()', 'Create an Interface current Class'],
                \'v': ['LangChangeVisibility()', 'Rotate the Visiblity'],
                \'a': ['LangGenerateAccessors()', 'Create Accessors'],
                \'s': ['LangCreateSettersAndGetters()', 'Create Setters And Getters'],
                \'g': ['LangCreateGetters()', 'Create Getters'],
            \},
            \'i': {
                \'name': 'Import',
                \'c': ['LangImportClass()', 'Import Class'],
                \'m': ['LangImportMissingClasses()', 'Import Missing Class'],
            \},
            \'g': {
                \'name': 'Goto',
                \'d': ['LangGotoDefinition()', 'Goto Definition'],
                \'i': ['LangGotoImplementations()', 'Goto Implementations'],
                \'f': ['LangFindReferences()', 'Find References'],
            \},
            \'d': {
            \'name': 'Doc',
                \'a': ['LangDocAll()', 'Create ALl Doc'],
            \},
            \'s': {
            \'name': 'Switch',
                \'t': ['LangUnitSwitchFile()', 'Switch Test'],
            \},
            \'t': ['LangTransform()', 'Transform'],
            \'k': ['LangHover()', 'Show Hover Information'],
            \'m': ['LangContextMenu()', 'Show Menu'],
            \}

" \'y': ['normal! `<v`>"+y', 'Copy'],
let g:which_key_map.j = { 
            \'name': 'Jump',
            \'i' : 'Import',
            \'g': 'Generate',
            \} 
let g:which_key_map.j.a = "Jump to Left"
let g:which_key_map.j.w = "Jump to Up"
let g:which_key_map.j.s = "Jump to Down"
let g:which_key_map.j.d = "Jump to Right"
let g:which_key_map.j.n = "Jump to Next wrap"
let g:which_key_map.j.p = "Jump to Previous wrap"

let g:which_key_map.j.i = {'name': 'Import'}
let g:which_key_map.j.i.A = "Import All Missing"
let g:which_key_map.j.i.a = "Import Missing with Ask"
let g:which_key_map.j.i.r = "RemoveUnused Imports"
let g:which_key_map.j.i.c = "Import Current Word Class"
let g:which_key_map.j.i.m = "Generate AbstractMethods"

let g:which_key_map.j.g = {'name': 'Generate'}
let g:which_key_map.j.g.A = "Generate All Accessors"
let g:which_key_map.j.g.a = "Generate Cursor Accessors"
let g:which_key_map.j.g.s = "Generate AccessorSetter"
let g:which_key_map.j.g.g = "Generate AccessorGetter"
let g:which_key_map.j.g.t = "Generate ToString"
let g:which_key_map.j.g.e = "Generate EqualsAndHashCode"
let g:which_key_map.j.g.c = "Generate empty Constructor"
let g:which_key_map.j.g.C = "Generate Constructor With Args"

let g:which_key_map.f = { 
            \'name': 'FZF & Find',
            \'+': ['FzfChangeFiles', 'Git Change Files'],
            \'T': ['FzfTags', 'Tags'],
            \'a': ['AckReplace(3)', 'Rg'],
            \'b': ['FzfBuffers', 'Buffers'],
            \'c': ['FzfCommits', 'Commit'],
            \'d': ['FzfCommands', 'Commands'],
            \'D': ['FzfDirs', 'NerdTreeFind'],
            \'f': ['ShowfindFiles()', 'File'],
            \'F': ['FzfFiletypes', 'File types'],
            \'h': ['FzfHistory', 'Histroy'],
            \'i': ['AckReplace(1)', 'Search'],
            \'I': ['AckReplace(2)', 'Replace'],
            \'l': ['FzfTodo', 'Todo List'],
            \'m': ['FZFBookmarks', 'Marks'],
            \'n': ['FZFNeigh', 'Neighbouring Files'],
            \'p': ['FzfMaps', 'Maps'],
            \'t': ['FzfBTags', 'Bufer`s Tags'],
            \'w': ['FzfWindows', 'Windows'],
            \} 


"let g:which_key_map.k = { 
            "\'name': 'Cscope',
            "\'n': ['GenGTAGS', 'Gen GTAGS'],
            "\'r': ['FzfCscope("s", "<cword>")', 'References'],
            "\'d': ['FzfCscope("g", "<cword>")', 'Global Definition'],
            "\'C': ['FzfCscope("d", "<cword>")', 'Calls'],
            "\'t': ['FzfCscope("t", "<cword>")', 'Text'],
            "\'T': ['FzfGtags', 'Tags'],
            "\'e': ['FzfCscope("e", "<cword>")', 'Egrep Search'],
            "\'f': ['FzfCscope("f", "<cword>")', 'Filename'],
            "\'i': ['FzfCscope("i", "<cword>")', 'Includes'],
            "\'c': ['FzfCscope("c", "<cword>")', 'called'],
            "\'a': ['FzfCscope("a", "<cword>")', 'Assigned'],
            "\} 

let g:which_key_map.g = { 
            \'name': 'Git',
            \'+': ['FzfChangeFiles', 'git change files'],
            \'a': ['Gwrite', 'git add'],
            \'b': ['Gblame', 'git blame'],
            \'c': ['Gcommit', 'git commit'],
            \'d': ['Gvdiff', 'git diff'],
            \'l': ['Gpull', 'git pull'],
            \'p': ['Gpush', 'git push'],
            \'r': ['Gremove', 'git remove'],
            \'s': ['Gstatus', 'git status'],
            \'j': ['<plug>(signify-next-hunk)', 'Jump Next Change'],
            \'k': ['<plug>(signify-prev-hunk)', 'Jump Prev Change'],
            \} 

let g:which_key_map.q = { 
            \'name': 'Quick List',
            \'n': ['cn', 'Next'],
            \'p': ['cp', 'Previous'],
            \'q': ['cclose', 'Quit'],
            \'l': ['cl', 'List'],
            \'o': ['copen', 'Open'],
            \} 

let g:which_key_map.c = { 'name': 'Comment'}
let g:which_key_map.c.a = "切换//和/**/"
let g:which_key_map.c.A = "行尾追加注释"
let g:which_key_map.c.b = "两端对齐注释"
let g:which_key_map.c.c = "添加注释"
let g:which_key_map.c.i = "反转注释"
let g:which_key_map.c.l = "左端对齐注释"
let g:which_key_map.c.m = "最小化注释"
let g:which_key_map.c.n = "嵌套注释"
let g:which_key_map.c.s = "性感注释"
let g:which_key_map.c.u = "取消注释"
let g:which_key_map.c.y = "复制并且注释"
let g:which_key_map.c[' '] = "切换注释"
let g:which_key_map.c['$'] = "注释到末尾"

let g:which_key_map.z = { 
            \'name': 'Zoom',
            \'a': ['ALEToggle', 'Ale Toggle'],
            \'m': ['ToggleMouse()', 'Toggle Mouse'],
            \'w': ['ToggleSet("wrap", "set nowrap", "set wrap")', 'Toggle Wrap'],
            \'r': ['Rooter', 'Change Root Path'],
            \'s': ['ToggleSyntax()', 'Syntax Toggle'],
            \'c' : ['popup_clear()', 'Clear Popup'],
            \'l' : ['TogglePopup()', 'Toggle Popup']
            \}
let g:which_key_map.z.q = 'Toggle Pairs'

let g:which_key_map.s = {
            \'name': 'Project',
            \'l': [':FzfProject', 'Project List'],
            \'i': [':ProjectInfo', 'Project Info'],
            \'e': [':ProjectExit', 'Project Exit'],
            \'r': [':ProjectRoot', 'Project Root'],
            \'c': [':ProjectConfig', 'Project Config'],
            \'h': [':ProjectPluginConfig', 'Project Plugin Config'],
            \'n': [':exec "Project(getcwd())"', 'New Project'],
            \}
let g:which_key_map.a = {
            \'name': 'AsyncRun',
            \'r': ['AsyncRunRun()', 'Run Current File'],
            \'m': ['AsyncRunMake()', 'Make File'],
            \'t': ['AsyncRunTest()', 'Run Test'],
            \'z': ['asyncrun#quickfix_toggle(6)', 'Toggle Async'],
            \'q': ['asyncrun#stop(6)', 'Stop Async']
            \}

" Create new menus not based on existing mappings:
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
"}}}
