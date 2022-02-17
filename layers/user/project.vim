if !exists('g:load_project_plugin') 
    call project#begin()
    let g:load_project_plugin = 1
endif

" Add '~/repository/project-name'
"ProjectBase '~/repository'
"Project 'project-name'

"ProjectBase '/path/to/vundle/plugins'
"Project 'vim-matchtag', { 'note': 'Just for test' }

" Absolute path that starts with '~' or '/' or '\w:'
"Project '~/repository/svelte-mode'