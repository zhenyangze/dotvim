if version > 800 || has("nvim")
Plug 'dense-analysis/ale', {'on': []}

"ale {{{
	let g:ale_sign_column_always = 1
	"%{ALEGetStatusLine()}
    let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:ale_set_highlights = 0
    "自定义error和warning图标
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚡'
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 
	let g:ale_set_loclist = 1
	let g:ale_set_quickfix = 0
	let g:ale_open_list = 0
	let g:ale_keep_list_window_open = 0
	let g:ale_lint_on_save = 1
	let g:ale_lint_on_text_changed = 1
    let g:ale_lint_on_enter = 1
    let g:ale_list_vertical = 0
    let g:ale_linters_explicit = 1
"}}}
let g:ale_is_loaded = 0
augroup load_ale
    autocmd!
    autocmd InsertEnter * call plug#load('ale') | let g:ale_is_loaded = 1 | autocmd! load_ale
augroup END

"autocmd! FileType fzf if(g:ale_is_loaded == 1) | :ALELintStop | endif | autocmd BufLeave <buffer> if(g:ale_is_loaded == 1) | :ALELint | endif
"autocmd! FileType fzf if(g:ale_is_loaded == 1) | :ALEDisable | endif | autocmd BufLeave <buffer> if(g:ale_is_loaded == 1) | :ALEEnable | endif

let g:ale_fixers = {
\  'php': ['remove_trailing_lines', 'isort', 'trim_whitespace'],
\ 'python': ['autopep8', 'nayvy#ale_fixer', 'isort'],
\}

let g:ale_linters = {
            \ 'cpp': ['clang'],
            \ 'c++': ['clang'],
            \ 'c': ['clang'],
            \ 'go': ['gopls'],
            \ 'php': ['phpstan']
            \}

let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/'
\   }
\ }

"nn <silent> <M-d> :ALEGoToDefinition<cr>
"nn <silent> <M-r> :ALEFindReferences<cr>
"nn <silent> <M-a> :ALESymbolSearch<cr>
"nn <silent> <M-h> :ALEHover<cr>
endif