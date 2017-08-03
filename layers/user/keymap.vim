" leader
let mapleader = "\<Space>"  " 这个leader就映射为逗号
let g:mapleader = "\<Space>"

" @ keymap
" -----------------------------------------------------------------------------
vnoremap < <gv
vnoremap > >gv
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
command! W w !sudo tee % > /dev/null

"屏蔽掉讨厌的F1键
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

" 将分号和冒号互换
"nnoremap ; :
"nnoremap : ;
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
    if (exists(":TagbarToggle") > 0 )
        silent! exec "TagbarToggle"
    else
        nmap <Leader>wf :Sex!<CR>
    endif
endfunction

function! ShowGunDo()
    if (exists(":GundoToggle") > 0 )
        silent! exec "GundoToggle"
    endif
endfunction

" 显示命令窗口
function! ShowShell ()
    if !exists("w:window_shell")
        let w:window_shell = 0
    endif

    if w:window_shell > 0 
        if (exists(":VimuxRunCommand") > 0 && exists('$TMUX'))
            silent! exec "VimuxCloseRunner"
        endif
        let w:window_shell = 0
    else
        if (exists(":VimuxRunCommand") > 0 && exists('$TMUX'))
            silent! exec "VimuxRunCommand 'll'"
        elseif (exists(":ConqueTermSplit") > 0)
            silent! exec ":ConqueTermSplit /bin/zsh"
        else
            exec ":! "
        endif

        let w:window_shell = 1
    endif
endfunction


" @ tabular
" -----------------------------------------------------------------------------
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
nmap <Leader>a$ :Tabularize /\$<CR>
vmap <Leader>a$ :Tabularize /\$<CR>


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

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

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
        execute "FZF"
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
  let l:files = system(a:cmd)
  if (l:files =~ '^\s*$')
    echomsg 'No matching files.'
    return
  endif
  new
  set filetype=filelist
  set buftype=nofile
  put =l:files
  normal ggdd
  nnoremap <buffer> <Enter> <C-W>gf
  execute 'autocmd BufEnter <buffer> lcd ' . getcwd()
endfunction
command! -nargs=1 Find call Find("find . -iname '*'" . shellescape('<args>') . "'*'")
command! -nargs=1 Gfind call Find('git ls-files | grep -E ' . shellescape('<args>'))
command! -nargs=1 Gtfind call Find('git rev-parse --show-toplevel && git ls-files | grep -E ' . shellescape('<args>'))
command! -nargs=1 Locate call Find('locate ' . shellescape('<args>'))

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
nmap <Leader>zw :set wrap<CR> "折行"
nmap <Leader>znw :set nowrap<CR> "关闭折行"
nmap <Leader>zp :set pastetoggle=<CR>  "黏贴折行"
nmap <Leader>zf :set foldcolumn=1<CR>  "折叠所在行"
nmap <Leader>znf :set foldcolumn&<CR>  "取消折叠"
nmap <Leader>zs :SyntasticToggleMode<CR>  "语法检测"
nmap <Leader>zl :LeaderGuideToggle<CR>  "引导开关"
nnoremap <silent> <leader>za :ArgWrap<CR>
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '<Leader>zq' "auto-pairs"

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
" -----------------------------------------------------------------------------
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

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
let g:lmap =  {
            \'1': ['tabn 1', 'No.1'],
            \'2': ['tabn 2', 'No.2'],
            \'3': ['tabn 3', 'No.3'],
            \'4': ['tabn 4', 'No.4'],
            \'5': ['tabn 5', 'No.5'],
            \'6': ['tabn 6', 'No.6'],
            \'7': ['tabn 7', 'No.7'],
            \'8': ['tabn 8', 'No.8'],
            \'9': ['tabn 9', 'No.9'],
            \}

let g:lmap.w = {
            \'name': 'Window',
            \'o': ['only', 'Only'],
            \'q': ['q', 'Quite'],
            \'c': ['q!', 'Close'],
            \'i': ['vs', 'Double'],
            \'t': ['call ShowNerdTree()', 'NerdTree'],
            \'s': ['NERDTreeTabsFind', 'NerdFind'],
            \'f': ['call ShowTagbarToggle()', 'TagBarToggle'],
            \'g': ['call ShowGunDo()', 'GunDoToggle'],
            \'b': ['call ShowShell()', 'Run Shell'],
            \}
let g:lmap.a = { 
            \'name' : 'Tabular',
            \}
let g:lmap.b = {
            \'name': 'Buffer',
            \'c': ['bwipeout', 'Close'],
            \'d': ['bnext', 'Next'],
            \'a': ['bprevious', 'Previous'],
            \'w': ['bfirst', 'First'],
            \'s': ['blast', 'Last'],
            \'n': ['enew', 'New'],
            \}
let g:lmap.e = {
            \'name': 'Edit',
            \'p': ['normal! "+gP"', 'Pase'],
            \'x': ['normal! "+x"', 'Cut'],
            \'f': ['let @+=expand("%")', 'Copy File Name'],
            \}
let g:lmap.p = {
            \'name': 'Php',
            \'r': {'name': 'rename'},
            \'e': {'name': 'Extract'},
            \'c': {'name': 'Create'},
            \'d': {'name': 'Doc'},
            \'a': {'name': 'Align'},
            \}

" \'y': ['normal! `<v`>"+y', 'Copy'],
vnoremap <leader>ey "+y"
noremap <leader>ea ggvG

let g:lmap.j = { 'name': 'Jump'} 
let g:lmap.f = { 
            \'name': 'FZF & Find',
            \'a': ['FzfAg', 'Ag'],
            \'c': ['FzfCommits', 'Commit'],
            \'b': ['FzfBuffers', 'Buffers'],
            \'l': ['FzfTodo', 'Todo List'],
            \'g': ['FzfLines', 'Lines'],
            \'f': ['call ShowfindFiles()', 'File'],
            \'d': ['FzfCommands', 'Commands'],
            \'t': ['FzfBTags', 'Bufer`s Tags'],
            \'T': ['FzfTags', 'Tags'],
            \'m': ['FzfMarks', 'Marks'],
            \'p': ['FzfMaps', 'Maps'],
            \'h': ['FzfHistory', 'Histroy'],
            \} 
let g:lmap.d = { 
            \'name': 'Directory',
            \} 
let g:lmap.t = {
            \'name': 'Tab',
            \'n': ['tabnew', 'New'],
            \'c': ['tabc', 'Close'],
            \'o': ['tabo', 'Only'],
            \'a': ['tabp', 'Previous'],
            \'d': ['tabn', 'Next'],
            \'w': ['tabfirst', 'First'],
            \'s': ['tablast', 'Last'],
           \}

let g:lmap.c = { 'name': 'Comment'}
let g:lmap.z = { 'name': 'Zoom'}
let g:lmap.r = {
            \'name': 'Reload & Replace',
            \'d': ['e ++ff=dos', 'Open As Dos'],
            \'u': ['e ++ff=unix', 'Open As Unix'],
            \'c': ['call Replace(0, 0, input("Replace ".expand("\<cword\>")." with: "))', '不确认、非整词'],
            \'r': ['call Replace(0, 1, input("Replace ".expand("\<cword\>")." with: "))', '不确认、整词'],
            \'ic': ['call Replace(1, 0, input("Replace ".expand("\<cword\>")." with: "))', '确认、非整词'],
            \'ir': ['call Replace(1, 1, input("Replace ".expand("\<cword\>")." with: "))', '确认、整词'],
            \}
let g:lmap.s = {
            \'name': 'Session',
            \'l': ['SessionList', 'List'],
            \'s': ['SessionSave', 'Save'],
            \'c': ['SessionClose', 'Close'],
            \}

" Create new menus not based on existing mappings:
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent><nowait> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent><nowait> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
"}}}
