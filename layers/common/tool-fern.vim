Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'


" Disable listing ignored files/directories
"let g:fern_git_status#disable_ignored = 1
" Disable listing untracked files
"let g:fern_git_status#disable_untracked = 1
" Disable listing status of submodules
"let g:fern_git_status#disable_submodules = 1
" Disable listing status of directories
"let g:fern_git_status#disable_directories = 1


augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open-or-expand)
  nmap <buffer> <enter> <Plug>(fern-action-open-or-expand)
  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
  nmap <buffer> ma <Plug>(fern-action-new-path)
  nmap <buffer> P gg

  nmap <buffer> C <Plug>(fern-action-enter)
  nmap <buffer> u <Plug>(fern-action-leave)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>

  nmap <buffer><expr>
              \ <Plug>(fern-my-expand-or-collapse)
              \ fern#smart#leaf(
              \   "\<Plug>(fern-action-collapse)",
              \   "\<Plug>(fern-action-expand)",
              \   "\<Plug>(fern-action-collapse)",
              \ )

  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)

  nmap <buffer> I <Plug>(fern-action-hide-toggle)

  nmap <buffer> q :<C-u>quit<CR>

  nmap <buffer> <Plug>(fern-my-enter-and-tcd)
      \ <Plug>(fern-action-enter)
      \ <Plug>(fern-wait)
      \ <Plug>(fern-action-tcd:root)

nmap <buffer> <Plug>(fern-my-leave-and-tcd)
      \ <Plug>(fern-action-leave)
      \ <Plug>(fern-wait)
      \ <Plug>(fern-action-tcd:root)
endfunction

let g:fern#renderer#default#leading="  "
let g:fern#renderer#default#root_symbol=" "
let g:fern#renderer#default#leaf_symbol="  "
let g:fern#renderer#default#collapsed_symbol="  "
let g:fern#renderer#default#expanded_symbol="  "