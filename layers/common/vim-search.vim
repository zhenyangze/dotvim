Plug 'wincent/ferret'
let g:FerretExecutable='ag,rg'

nmap <leader>foa <Plug>(FerretAck)
vmap <leader>foa :call AckVisualSearch()<cr>
nmap <leader>for <Plug>(FerretAcks)
nmap <leader>fow <Plug>(FerretAckWord)
nmap <leader>fol <Plug>(FerretLack)
