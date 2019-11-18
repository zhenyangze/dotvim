Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

nnoremap <Leader>dt :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <silent> <leader>dc :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <Leader>dr :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <Leader>dm :AsyncRun -cwd=<root> cmake . <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
nnoremap <silent> <Leader>db :AsyncRun -cwd=<root> make <cr>
nnoremap <silent> <Leader>dp :AsyncRun -cwd=<root> -mode=4 make run <cr>