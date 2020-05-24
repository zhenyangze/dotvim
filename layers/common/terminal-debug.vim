"Plug 'puremourning/vimspector'
Plug 'vim-vdebug/vdebug'

"let g:vimspector_enable_mappings = 'HUMAN'
"./install_gadget.py --enable-c --enable-go --enable-python --force-enable-php
"php export XDEBUG_CONFIG="idekey=xdebug"
"c: gcc 1.c -ggdb -o 1

"Action                        | WinBar   | Keyboard
"Start debugging               | None     | <F5>
"Continue until break          | Continue | <F5>
"Step over                     | Next     | <F10>
"Step into                     | Step     | <F11>
"Complete the current funcion  | Finish   | <F12>
"Toggle breakpoint             | None     | <F9>
"Stop debugging                | Reset    | <F3>
"Start again with same options | Restart  | <F4>
"Interrupt the debugee         | Pause    | <F6>


let g:vdebug_keymap = {
            \    "run" : "<F5>",
            \    "run_to_cursor" : "<F9>",
            \    "step_over" : "<F2>",
            \    "step_into" : "<F3>",
            \    "step_out" : "<F4>",
            \    "close" : "<F6>",
            \    "detach" : "<F7>",
            \    "set_breakpoint" : "<F10>",
            \    "get_context" : "<F11>",
            \    "eval_under_cursor" : "<F12>",
            \    "eval_visual" : "<Leader>de",
            \}
let g:vdebug_options = {
            \    'port' : 9000,
            \    'timeout' : 20,
            \    'server' : '',
            \    'on_close' : 'stop',
            \    'break_on_open' : 1,
            \    'max_children' : 128,
            \    'ide_key' : '',
            \    'debug_window_level' : 0,
            \    'debug_file_level' : 0,
            \    'debug_file' : '',
            \    'path_maps' : {},
            \    'watch_window_style' : 'compact',
            \    'marker_default' : '⬦',
            \    'marker_closed_tree' : '▸',
            \    'marker_open_tree' : '▾',
            \    'sign_breakpoint' : '▷',
            \    'sign_current' : '▶',
            \    'continuous_mode'  : 1,
            \    'simplified_status': 1,
            \    'layout': 'vertical',
            \}
