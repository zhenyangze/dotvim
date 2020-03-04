silent! call determined#command('PHP', 'php', { 'vertical': 0, 'rows': '8', 'cols': '40%' })

autocmd TextChangedI,CompleteDone * silent! exec "call popup_clear()"

let g:phpactorPhpBin = "/Applications/MxSrvs/bin/php/bin/php"
let g:phpactorOmniAutoClassImport = v:true

let g:gen_tags#blacklist = ['$HOME']
let g:gen_tags#blacklist += split(glob('~/.vim/plugged/*'))
let g:gen_tags#blacklist += split(glob('~/.vim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/plugged/*'))


let g:fzf_layout = { 'down': '~40%' }
set cmdheight=1
