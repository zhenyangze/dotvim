"silent! call determined#command('PHP', 'php', { 'vertical': 0, 'rows': '8', 'cols': '40%' })
"silent! call determined#command('S', ' ', { 'vertical': 0, 'rows': '8', 'cols': '40%', 'singleton': '1' })

autocmd TextChangedI,CompleteDone,InsertLeave * silent! exec "call popup_clear()"

let g:coc_global_extensions = ['coc-css', 'coc-snippets', 'coc-phpls', 'coc-python', 'coc-html']

let g:phpactorPhpBin = "/Applications/MxSrvs/bin/php/bin/php"
let g:phpactorOmniAutoClassImport = v:true

let g:gen_tags#blacklist = ['$HOME']
let g:gen_tags#blacklist += split(glob('/Users/yangze'))
let g:gen_tags#blacklist += split(glob('~/.vim/plugged/*'))
let g:gen_tags#blacklist += split(glob('~/.vim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/plugged/*'))


"let g:fzf_layout = { 'down': '~40%' }
let $FZF_DEFAULT_OPTS .= ' --inline-info --layout=reverse'
if version > 800
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'rounded' } }
else
    let g:fzf_layout = { 'down': '~40%' }
endif
let g:fzf_popup_status = 1

set cmdheight=1

" close quickfix
autocmd bufenter * if (winnr("$") == 1 && &buftype == 'quickfix') | q | endif
