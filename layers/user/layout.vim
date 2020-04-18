" 主窗口 ，左侧窗口，底部窗口

"nofile
let g:tools_left_windows = {
            \     'voomtree': {
            \            'hide': 'VoomQuitAll',
            \            'show': 'Voom',
            \            'toggle': 'VoomToggle'
            \            },
            \     'nerdtree': {
            \            'hide': 'NERDTreeClose',
            \            'show': 'NERDTree',
            \            'toggle': 'NERDTreeToggle'
            \            },
            \     'vista': {
            \            'hide': 'Vista!',
            \            'show': 'Vista',
            \            'toggle': 'Vista!!'
            \            }
            \ }

let g:tools_bottom_windows = {
            \     'terminal': '',
            \     'quickfix': ''
            \ }
" 打开左侧工具
" 关闭左侧工具
function! FindLeftWindow(type)
    for key in keys(g:tools_left_windows)
        if a:type == key
            silent! execute g:tools_left_windows[key]['show']
        else
            silent! execute g:tools_left_windows[key]['hide']
        endif
    endfor
endfunction