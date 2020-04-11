let mapleader="\<Space>"
let s:vim_home='~/.vim/'

if has('nvim')
    let g:python3_host_prog = '/Users/yangze/anaconda2/envs/python36/bin/python3'
    let g:python_host_prog = '/usr/bin/python'
end

" init 
if empty(glob("~/.vim/autoload/plug.vim"))
  echo "Installing vim-plug..."
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Run :PlugInstall to install plugins"
endif

" plugin
syn sync fromstart
set nocompatible
filetype off 
let s:plug_files = [
  \ "layers/common/*.vim",
  \ "layers/language/*.vim",
  \ ]

call plug#begin('~/.vim/plugged')

let g:plug_threads = 8
let g:plug_timeout = 3600
for files in s:plug_files
  for f in split(glob(s:vim_home.files), "\n")
    exec "source ".f
  endfor
endfor

call plug#end()
filetype plugin indent on

" user
let s:user_files = [
  \ "layers/user/*.vim",
  \ ]
for files in s:user_files
  for f in split(glob(s:vim_home.files), "\n")
    exec "source ".f
  endfor
endfor