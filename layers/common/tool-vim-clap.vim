if version > 800
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

"call clap#installer#build_maple()

let g:clap_theme = 'spacemacs-theme'
let g:clap_provider_edit_dot = {
            \ 'source': ['~/.vimrc', '~/.bash_alias', '~/.tmux.conf', '/etc/hosts'],
            \ 'sink': 'e',
            \ }

endif