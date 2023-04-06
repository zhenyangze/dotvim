if has('nvim')
    call wilder#setup({'modes': [':', '/', '?']})
    call wilder#set_option('pipeline', [
                \   wilder#branch(
                \     wilder#cmdline_pipeline({
                \       'language': 'python',
                \       'fuzzy': 1,
                \     }),
                \     wilder#python_search_pipeline({
                \       'pattern': wilder#python_fuzzy_pattern(),
                \       'sorter': wilder#python_difflib_sorter(),
                \       'engine': 're',
                \     }),
                \   ),
                \ ])

    call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
                \ 'border': 'rounded',
                \ 'max_height': '75%',
                \ 'min_height': 0,
                \ 'prompt_position': 'top',
                \ 'reverse': 0,
                \ })))
endif
