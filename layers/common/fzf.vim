Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'


"  fzf {{{
"set rtp+=~/.fzf
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 0
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

autocmd VimEnter * command! -bang Colors
            \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* FzfTodo
  \ call fzf#vim#ag('[^\w_\$\''''\>](FIXME|TODO|todo|fixme|Todo|ToDo|toDo):?[^\w_\/\(\'''']',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=* FzfPHPClass
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "^[\s]*class\s+(\S+)"', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0
            \ )

command! -bang -nargs=* FzfPHPFunction
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -t php  -e  "^[\s]*(private|protected|public)?\s*(static)?\s*function\s+(\S+)"', 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0
            \ )


command! -bang FzfDirs
            \ call fzf#run(fzf#wrap('fzfdirs', {'source':'find .  -type d  \( ! -iname ".*" \) | sed "s|^\./||g"', 'sink': 'NERDTreeFind'}, 0))

let g:fzf_command_prefix = 'Fzf'
let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case '
"}}}