Plug 'w0rp/ale'

"ale {{{
	let g:ale_sign_column_always = 1
	"%{ALEGetStatusLine()}
	let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 
	let g:ale_set_loclist = 1
	let g:ale_set_quickfix = 0
	let g:ale_open_list = 0
	let g:ale_keep_list_window_open = 0
	let g:ale_lint_on_save = 1
	let g:ale_lint_on_text_changed = 1
"}}}