"silent! call determined#command('PHP', 'php', { 'vertical': 0, 'rows': '8', 'cols': '40%' })
"silent! call determined#command('S', ' ', { 'vertical': 0, 'rows': '8', 'cols': '40%', 'singleton': '1' })

autocmd TextChangedI,CompleteDone,InsertLeave * silent! exec "call popup_clear()"

let g:coc_global_extensions = ['coc-css', 'coc-snippets', 'coc-pyright', 'coc-html', 'coc-sh', 'coc-java', 'coc-sumneko-lua', 'coc-json', 'coc-rust-analyzer']

"let g:phpactorPhpBin = "/Applications/MxSrvs/bin/php/bin/php"
let g:phpactorOmniAutoClassImport = v:true

let g:gen_tags#blacklist = ['$HOME']
"let g:gen_tags#blacklist += split(glob('/Users/yangze'))
"let g:gen_tags#blacklist += split(glob('~/.vim/plugged/*'))
"let g:gen_tags#blacklist += split(glob('~/.vim/*'))
"let g:gen_tags#blacklist += split(glob('~/.config/dotvim/*'))
"let g:gen_tags#blacklist += split(glob('~/.config/dotvim/plugged/*'))


"let g:fzf_layout = { 'down': '~40%' }
let $FZF_DEFAULT_OPTS .= ' --inline-info --layout=reverse'
if has("nvim") > 0
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.675, 'border': 'rounded' } }
elseif version > 800
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.675, 'border': 'rounded' } }
else
    let g:fzf_layout = { 'down': '~40%' }
endif
let g:fzf_popup_status = 1
"let g:fzf_preview_window = "right:50%"
let g:fzf_preview_window = "down"

set cmdheight=1

" close quickfix
autocmd bufenter * if (winnr("$") == 1 && &buftype == 'quickfix') | q | endif


let g:qf_min_height = 7
let g:qf_max_height = 12
if version > 800
    au FileType qf call AdjustWindowHeight()
endif
function! AdjustWindowHeight()
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
    exe max([min([line('$'), g:qf_max_height]), g:qf_min_height]) . "wincmd _"
endfunction

 let g:context_enabled = 0

 let g:rooter_patterns = ['artisan', 'think', 'composer.lock', 'go.mod', 'pom.xml']
 let g:coc_disable_startup_warning = 1
