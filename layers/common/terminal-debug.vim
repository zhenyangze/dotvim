Plug 'puremourning/vimspector'

let g:vimspector_enable_mappings = 'HUMAN'
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
