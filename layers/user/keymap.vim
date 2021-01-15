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


" @ window
" -----------------------------------------------------------------------------
function! ShowNerdTree()
    if (exists(":NERDTreeTabsToggle") == 0)
        silent! exec "NERDTreeToggle"
    else
        silent! exec "NERDTreeTabsToggle"
    endif
endfunction

function! ShowTagbarToggle()
    if (exists(":Vista") > 0 )
        silent! exec "Vista!!"
    else
        nmap <Leader>wf :Sex!<CR>
    endif
endfunction

function! ShowGunDo()
    if (exists(":GundoToggle") > 0 )
        silent! exec "GundoToggle"
    endif
endfunction

" jump to window
function! JumpToWindow(num)
    let l:winId = win_getid(a:num)
    if l:winId == 0
        return
    endif
    silent! call win_gotoid(l:winId)
endfunction

" jump to tab
function! JumpToTab(num)
    exec "tabn " . a:num
endfunction

" ToggleMouse 
let g:mouse_status = 0
function! ToggleMouse()
    if (g:mouse_status == 0) 
        let g:mouse_status = 1
        set mouse=a
        set scrolloff=0
    else
        let g:mouse_status = 0
        set mouse=""
        set scrolloff=30
    endif
endfunction

function! ToggleSyntax()
    if exists("g:syntax_on") 
        syntax off 
    else 
        syntax enable
    endif
endfunction

let g:toggle_list_data = {}
function! ToggleSet(type, firstCommand, secondCommand)
    if (get(g:toggle_list_data, a:type) == 0) 
        let g:toggle_list_data[a:type]=1
        exec a:firstCommand
    else
        let g:toggle_list_data[a:type]=0
        exec a:secondCommand
    endif
endfunction

let g:fzf_popup_status = 1
function! TogglePopup()
    if (g:fzf_popup_status == 0)
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
        let g:fzf_popup_status = 1
    else 
        let g:fzf_layout = { 'down': '~40%' }
        let g:fzf_popup_status = 0
    endif
endfunction

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '


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
function! ShowfindFiles()
    if (g:loaded_fzf > 0)
        "execute "FZF"
        call FzfFilesFunction()
    elseif (g:leaderf_loaded > 0)
        if (exists("g:Lf_ShortcutF"))
            execute "Leaderf"
        else
            let g:Lf_ShortcutF = '<Leader>zf'
            execute "Leaderf"
        endif
    else
        let findFileName = escape(input('find file: '), '/\&~')
        silent! execute "Find ".findFileName
    endif
endfunction


function! Find(cmd)
    if (executable('ag'))
        call fzf#run(fzf#wrap('fzffind', {'source': a:cmd}, 0))
    else
        let l:files = system(a:cmd)
        if (l:files =~ '^\s*$')
            echomsg 'No matching files.'
            return
        endif
        "new
        vne
        set filetype=filelist
        set buftype=nofile
        silent! put =l:files
        normal ggdd
        nnoremap <buffer> <Enter> <C-W>gf
        execute 'autocmd BufEnter <buffer> lcd ' . getcwd()
    endif
endfunction
command! -nargs=1 Find call Find("find . -iname '*'" . shellescape('<args>') . "'*'")
command! -nargs=1 Gfind call Find('git ls-files | grep -E ' . shellescape('<args>'))
command! -nargs=1 Gtfind call Find('git rev-parse --show-toplevel && git ls-files | grep -E ' . shellescape('<args>'))
command! -nargs=1 Locate call Find('locate ' . shellescape('<args>'))
command! -nargs=1 Grep call Find("rg --column --line-number --no-heading --no-ignore --smart-case " . shellescape('<args>'))

function! BesideFile(type)
    let l:current_dir = expand("%:p:h")
    let l:current_file = expand("%:p:f")
    if (a:type == 'invert')
        let l:file_list = split(system("find " . l:current_dir . " -type f -maxdepth 1 ! -name '*.o' ! -name '.*' | sort -f -r"), "\n")
    else
        let l:file_list = split(system("find " . l:current_dir . " -type f -maxdepth 1 ! -name '*.o' ! -name '.*' | sort -f"), "\n")
    endif
    let l:current_index = -1
    let l:index = 0
    for item in l:file_list
        let l:index += 1
        if (item == l:current_file) 
            let l:current_index = l:index
        endif
        if (l:index == (l:current_index + 1))
            echomsg "open " . item
            silent! execute('e ' . item)
            break
        endif
    endfor
    if (l:current_index == l:index)
        echomsg "the last one"
    endif
endfunction

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

function! TagsJumpFunction()
    let s:current_word = expand("<cword>")
    exec "tag " . s:current_word
endfunction

function! FzfTagsFunction()
    let s:current_word = GetVisualSelection()
    exec "FzfTags " . s:current_word
endfunction
function! FzfFilesFunction()
    let s:current_word = GetVisualSelection()
    if len(s:current_word) == 0 
        let s:current_word = expand("<cword>")
    endif
    let g:fzf_files_options = ['-m', '--query', s:current_word]
    exec "FzfFiles"
    let g:fzf_files_options = ['-m', '--query', '']
endfunction
function! AckVisualSearch()
    let s:current_word = GetVisualSelection()
    exec "Ack " . substitute(escape(s:current_word, '\'), ' ', '\\ ', 'g')
endfunction

let g:ack_search_str = ""
function! AckReplace(is_replace)
    let l:search_str = input("Search String: ", g:ack_search_str)
    let g:ack_search_str = l:search_str
    if a:is_replace == 1
        let l:search_path = input("Search Path: ", "./", "file")
    elseif a:is_replace == 2
        let l:replace_str = input("Replace String: ", "")
    endif
    let l:reg_list = ['\\', '$', '-', '[', ']', '(', ')', ' ', '{', '}', '?']

    for item in l:reg_list
        let l:search_str = escape(l:search_str, item)
    endfor
    if a:is_replace == 2
        for item in l:reg_list
            let l:replace_str = escape(l:replace_str, item)
        endfor
    endif
 
    if a:is_replace == 2
        exec "Acks /" . search_str . "/" . l:replace_str . "/ "
    elseif a:is_replace == 1
        exec "Ack " . search_str . " ". l:search_path
    else
        exec "Ag " . search_str
    endif
endfunction


function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction
" get Regular
function! GetSelectedText()
       let tmp = @"
       normal! gvy
       normal! gv
       let [tmp, @"] = [@", tmp]
       return tmp
endfunc

function! PlainTextPattern(s)
       return substitute(substitute('\V'.escape(a:s, '\'), '\n', '\\n', 'g'), '\t', '\\t', 'g')
endfunc

function! GetSearchPat()
    let @+ = PlainTextPattern(GetSelectedText())
endfunc

function! InitTemplate()
    silent! execute 'Template *.' . expand('%:e')
endfunction

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
            \'f': [':Fern . -drawer', 'Files Tree'],
            \'s': [':Fern . -reveal=% -drawer', 'Find Files'],
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

vnoremap <leader>ecy "+y"
noremap <leader>ecv ggvG$
noremap <leader>eca :%y<CR>
noremap <leader>ecr :call GetSearchPat()<CR>
let g:which_key_map.e = {
            \'name': 'Edit',
            \'a': {'name': 'Align'},
            \'c': {'name': 'Copy'},
            \'f': {
                \'name': 'File',
                \'c': [':exec "let @+=expand(\"%:f\")"', 'Copy File Name With Path'],
                \'f': [':exec "let @+=expand(\"%:t:r:r\")"', 'Copy File Name'],
                \'e': [':exec "let @+=expand(\"%:t\")"', 'Copy File Name With Extension'],
                \'a': [':exec "let @+=expand(\"%:p:h\")"', 'Copy File Absolute Path'],
                \'r': [':exec "let @+=expand(\"%:h\")"', 'Copy File Relative Path'],
                \'l': [':e!', 'Reload File'],
                \},
            \'y': {
                \'name': 'Yank',
                \'l': ['YRShow', 'Show Yank List']
                \},
            \'m': {
                \'name' : 'Model',
                \'x': [':%!xxd', 'Into Hex Model'],
                \'r': [':%!xxd -r', 'Info Custom Model'],
                \},
            \'t': {
                \'name': 'transform',
                \'a': ['ArgWrap', '参数折叠'],
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

let g:which_key_map.h = {
            \'name': 'Helper',
            \'f': ['TranslateW', 'Translate'],
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
            \'name': 'Php',
            \'r': {
            \'name': 'Rename',
            \'V': ['PhpRenameLocalVariable()', 'Rename Local Variable'],
            \'v': ['PhpRenameClassVariable()', 'Rename Class Variable'],
            \'m': ['PhpRenameMethod()', 'Rename Method'],
            \},
            \'e': {
                \'name': 'Extract && Expand',
                \'e': ['PhpactorExtractExpression', 'Extract Expression'],
                \'f': ['PhpactorClassExpand', 'Expand Full CLass Name'],
                \'c': ['PhpExtractConst()', 'Extract Const'],
                \'u': ['PhpExtractUse()', 'Extract Use'],
                \'p': ['PhpExtractClassProperty()', 'Extract Property'],
                \'m': ['PhpExtractMethod()', 'Extract Method'],
            \},
            \'c': {
                \'name': 'Create && Content && Change',
                \'c': ['PhpactorClassNew', 'Create New Class'],
                \'i': ['PhpactorClassInflect', 'Create an Interface current Class'],
                \'v': ['PhpactorChangeVisibility', 'Rotate the Visiblity'],
                \'a': ['PhpactorGenerateAccessors', 'Create Accessors'],
                \'s': ['PhpCreateSettersAndGetters()', 'Create Setters And Getters'],
                \'g': ['PhpCreateGetters()', 'Create Getters'],
            \},
            \'i': {
                \'name': 'Import',
                \'c': ['PhpactorImportClass', 'Import Class'],
                \'m': ['PhpactorImportMissingClasses', 'Import Missing Class'],
            \},
            \'g': {
                \'name': 'Goto',
                \'d': ['PhpactorGotoDefinition', 'Goto Definition'],
                \'v': ['PhpactorGotoDefinitionVsplit', 'Goto Definition With Vertical Split'],
                \'t': ['PhpactorGotoDefinitionTab', 'Goto Definition In New Tab'],
                \'h': ['PhpactorGotoDefinitionHsplit', 'Goto Definition With Horizontal Split'],
                \'i': ['PhpactorGotoImplementations', 'Goto Implementations'],
                \'f': ['PhpactorFindReferences', 'Find References'],
                \'n': ['phpactor#Navigate()', 'Jump to Relationships'],
            \},
            \'d': {
            \'name': 'Doc',
                \'a': ['PhpDocAll()', 'Create ALl Doc'],
            \},
            \'a': [":'<,'>call PhpAlignAssigns()<cr>", 'Align'],
            \'f': {
                \'name': 'File',
                \'f': ['PhpFmt', 'formt'],
                \'c': ['PhpactorCopyFile', 'Copy File'],
                \'m': ['PhpactorMoveFile', 'Move File'],
            \},
            \'t': ['phpactor#Transform()', 'Transform'],
            \'k': ['PhpactorHover', 'Show Hover Information'],
            \'m': ['PhpactorContextMenu', 'Show Menu'],
            \}

" \'y': ['normal! `<v`>"+y', 'Copy'],
let g:which_key_map.j = { 
            \'name': 'Java && Jump',
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
            \'G': ['Gtags -r', 'gtags'],
            \'T': ['FzfTagsFunction()', 'Tags'],
            \'a': ['AckReplace(3)', 'Rg'],
            \'b': ['FzfBuffers', 'Buffers'],
            \'c': ['FzfCommits', 'Commit'],
            \'d': ['FzfCommands', 'Commands'],
            \'D': ['FzfDirs', 'NerdTreeFind'],
            \'e': ['FzfCscope("e", "<cword>")', 'Goto string'],
            \'f': ['ShowfindFiles()', 'File'],
            \'F': ['FzfFiletypes', 'File types'],
            \'g': ['Gtags', 'gtags'],
            \'h': ['FzfHistory', 'Histroy'],
            \'i': ['AckReplace(1)', 'Search'],
            \'I': ['AckReplace(2)', 'Replace'],
            \'l': ['FzfTodo', 'Todo List'],
            \'m': ['FzfMarks', 'Marks'],
            \'n': ['FZFNeigh', 'Neighbouring Files'],
            \'p': ['FzfMaps', 'Maps'],
            \'r': ['FzfCscope("c", "<cword>")', 'Goto calling'],
            \'s': [':cs find g <cword>', 'Goto definition'],
            \'t': ['FzfBTags', 'Bufer`s Tags'],
            \'w': ['FzfWindows', 'Windows'],
            \} 

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
            \'q': ['cq', 'Quit'],
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
            \'l': [':ProjectList', 'Project List'],
            \'i': [':ProjectInfo', 'Project Info'],
            \'e': [':ProjectExit', 'Project Exit'],
            \'r': [':ProjectRoot', 'Project Root'],
            \'c': [':ProjectConfig', 'Project Config'],
            \'h': [':ProjectPluginConfig', 'Project Plugin Config'],
            \}
let g:which_key_map.a = {
            \'name': 'AsyncRun',
            \'r': ['AsyncRunRun()', 'Run Current File'],
            \'m': ['AsyncRunMake()', 'Make File'],
            \'t': ['asyncrun#quickfix_toggle(6)', 'Toggle Async'],
            \'q': ['asyncrun#stop(6)', 'Stop Async']
            \}

" Create new menus not based on existing mappings:
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
"}}}
