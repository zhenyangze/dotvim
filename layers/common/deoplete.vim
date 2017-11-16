if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
endif
execute 'python import neovim'
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']