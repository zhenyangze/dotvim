let mapleader="\<Space>"
let s:vim_home='~/.vim/'

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
    exec "runtime! " . files
endfor

call plug#end()

" user
let s:user_files = [
  \ "layers/user/*.vim",
  \ ]
for files in s:user_files
    exec "runtime! " . files
endfor