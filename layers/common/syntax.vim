Plug 'w0rp/ale'

"ale {{{
	let g:ale_sign_column_always = 1
	"%{ALEGetStatusLine()}
    let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:ale_set_highlights = 0
    "自定义error和warning图标
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚡'
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 
	let g:ale_set_loclist = 1
	let g:ale_set_quickfix = 1
	let g:ale_open_list = 1
	let g:ale_keep_list_window_open = 0
	let g:ale_lint_on_save = 1
	let g:ale_lint_on_text_changed = 0
    let g:ale_lint_on_enter = 0
"}}}

" phpmd {{{
" https://www.kancloud.cn/bajiao/phpmd/128478
"let g:ale_php_phpmd_ruleset = get(g:, 'ale_php_phpmd_ruleset', 'cleancode,codesize,controversial,design,naming,unusedcode')
let g:ale_php_phpmd_ruleset = "codesize,unusedcode"
" }}}