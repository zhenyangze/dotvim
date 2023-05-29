Plug 'chemzqm/vim-easygit'
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
let g:easygit_enable_command = 1

command! Gqf GitGutterQuickFix | copen
nmap ghp <Plug>(GitGutterPreviewHunk)