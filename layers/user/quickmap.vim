"nmap ,b :FzfBuffers<CR>
nmap ,a gg0vG$<CR>

if has("nvim")
    tmap ,b <C-\><C-n>:call ToggleWindowShow(['conque_term', 'zsh'], 'VSTerminalToggle', 'quit')<CR>
elseif version > 800
    tmap ,b <C-w>:call ToggleWindowShow(['conque_term', 'zsh'], 'VSTerminalToggle', 'quit')<CR>
endif
nmap ,b <C-w>:call ToggleWindowShow(['conque_term', 'zsh'], 'VSTerminalToggle', 'quit')<CR>
"nmap ,G :Ag <C-R>=expand("<cword>")<CR><CR>
"nmap ,g :Ag<CR>
"nmap ,p :ProjectList<cr>
"nmap ,t :silent! Fern . -drawer<CR>
"vmap ,g :<C-u>Ag <C-R>=expand("<cword>")<CR><CR>
nmap ,1 :call JumpToWindow(1)<CR>
nmap ,2 :call JumpToWindow(2)<CR>
nmap ,3 :call JumpToWindow(3)<CR>
nmap ,4 :call JumpToWindow(4)<CR>
nmap ,5 :call JumpToWindow(5)<CR>
nmap ,6 :call JumpToWindow(6)<CR>
nmap ,D :Dox<CR>
"nmap ,F :RgAllFiles<CR>
nmap ,G :RgAll<CR>
nmap ,R :redraw<CR>
nmap ,T :FzfTags<CR>
nmap ,V :CtrlSFToggle<CR>
nmap ,t :FloatermToggle<CR>
nmap ,c :call ToggleWindowShow('qf', 'copen', 'cclose')<CR>
nmap ,d :FzfDirs<CR>
nmap ,e :call AckReplace(1)<CR>
nmap ,E :call AckReplace(2)<CR>
nmap ,f :RgFiles<CR>
nmap ,g :Rg<CR>
nmap ,h :Startify<CR>
"nmap ,k :FzfGtags<CR>
nmap ,l :call AutoFormatFile()<CR>
nmap ,m :FZFBookmarks<CR>
nmap ,n :tabnew<CR>
"nmap ,o :call ToggleWindowShow('tagbar', 'call ShowTagbarToggle()', 'call ShowTagbarToggle()')<CR>
nmap ,p :FzfProject<cr>
nmap ,q :q!<CR>
nmap ,r :Rooter<CR>
nmap ,s :call FernFindCurrentFile()<CR>
nmap ,k :TagbarToggle<CR>
nmap ,w :w!<CR>
nmap ,y :YankHistoryRgPaste<CR>
vmap ,f :<C-u>call FzfFilesFunction()<CR>
vmap ,g :<C-U>execute("Rg " . GetRgSearchTextV2(""))<CR>
vmap ,v :<C-U>execute("CtrlSF \"" . escape(GetCtrlsfSearchText(""), '"') . "\"")<CR>
nmap ,v :<C-U>execute("CtrlSF \"" . escape(GetCtrlsfSearchText(""), '"') . "\"")<CR>
nmap ,/ :<C-u>BitoAi
vmap ,/ :BitoAi
nmap // :FzfBLines<CR>

nmap =1 :q 1<CR>
nmap =2 :q 2<CR>
nmap =3 :q 3<CR>
nmap =4 :q 4<CR>
nmap =5 :q 5<CR>

noremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

nnoremap [s :<c-u>ALEPrevious<cr>
nnoremap ]s :<c-u>ALENext<cr>


nnoremap [b :<c-u>bp<cr>
nnoremap ]b :<c-u>bn<cr>

nnoremap [f :<c-u>call BesideFile("invert")<cr>
nnoremap ]f :<c-u>call BesideFile("")<cr>

nmap [q :<c-u>cp<cr>
nmap ]q :<c-u>cn<cr>
nmap [l :<c-u>lprevious<cr>
nmap ]l :<c-u>lnext<cr>
