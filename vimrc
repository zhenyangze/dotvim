let mapleader="\<Space>"
let s:vim_home='~/.vim/'

if empty(glob("~/.vim/autoload/plug.vim"))
  echo "Installing vim-plug..."
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Run :PlugInstall to install plugins"
endif

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
source ~/.vim/layers/keymap/keymap.vim