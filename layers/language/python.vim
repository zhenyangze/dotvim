"Plug 'taohaoge/python-mode',{ 'for': 'python'}
Plug 'kh3phr3n/python-syntax',{ 'for': 'python'}
"Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim',{ 'for': 'python'}
Plug 'relastle/vim-nayvy', { 'for': 'python' }
"Plug 'cjrh/vim-conda',{ 'for': 'python'}
fun! LoadPythonEnv()
    "python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this, encoding = 'utf-8').read())
EOF
endfun

autocmd FileType python call LoadPythonEnv()
