"silent! call determined#command('PHP', 'php', { 'vertical': 0, 'rows': '8', 'cols': '40%' })
"silent! call determined#command('S', ' ', { 'vertical': 0, 'rows': '8', 'cols': '40%', 'singleton': '1' })

autocmd TextChangedI,CompleteDone,InsertLeave * silent! exec "call popup_clear()"

let g:coc_global_extensions = ['coc-css', 'coc-snippets', 'coc-phpls', 'coc-python', 'coc-html', 'coc-sh', 'coc-java', 'coc-tabnine', 'coc-tsserver', 'coc-sumneko-lua', 'coc-json', 'coc-rls']

"let g:phpactorPhpBin = "/Applications/MxSrvs/bin/php/bin/php"
let g:phpactorOmniAutoClassImport = v:true

let g:gen_tags#blacklist = ['$HOME']
let g:gen_tags#blacklist += split(glob('/Users/yangze'))
let g:gen_tags#blacklist += split(glob('~/.vim/plugged/*'))
let g:gen_tags#blacklist += split(glob('~/.vim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/*'))
let g:gen_tags#blacklist += split(glob('~/.config/dotvim/plugged/*'))


"let g:fzf_layout = { 'down': '~40%' }
let $FZF_DEFAULT_OPTS .= ' --inline-info --layout=reverse'
if has("nvim") > 0
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'rounded' } }
elseif version > 800
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'rounded' } }
else
    let g:fzf_layout = { 'down': '~40%' }
endif
let g:fzf_popup_status = 1
"let g:fzf_preview_window = "right:50%"
let g:fzf_preview_window = "down"

set cmdheight=1

" close quickfix
autocmd bufenter * if (winnr("$") == 1 && &buftype == 'quickfix') | q | endif


au FileType qf call AdjustWindowHeight(2, 7)
function! AdjustWindowHeight(minheight, maxheight)
    "let l = 1
    "let n_lines = 0
    "let w_width = winwidth(0)
    "let lineNums = line('$')
    "while l <= line('$')
        "" number to float for division
        "let l_len = strlen(getline(l)) + 0.0
        "let line_width = l_len/w_width
        "let n_lines += float2nr(ceil(line_width))
        "let l += 1
    "endw
    exe max([min([line('$'), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

 let g:context_enabled = 0
