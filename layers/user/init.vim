"silent! call determined#command('PHP', 'php', { 'vertical': 0, 'rows': '8', 'cols': '40%' })
"silent! call determined#command('S', ' ', { 'vertical': 0, 'rows': '8', 'cols': '40%', 'singleton': '1' })

autocmd TextChangedI,CompleteDone,InsertLeave * silent! exec "call popup_clear()"

let g:phpactorPhpBin = "/Applications/MxSrvs/bin/php/bin/php"
let g:phpactorOmniAutoClassImport = v:true

let g:gen_tags#blacklist = ['$HOME']
let g:gen_tags#blacklist += split(glob('/Users/yangze'))
let g:gen_tags#blacklist += split(glob('~/.vim/plugged/*'))
let g:gen_tags#blacklist += split(glob('~/.vim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/plugged/*'))


"let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_popup_status = 1
set cmdheight=1
