 Plug 'zhenyangze/vim-project'
 

 let g:vim_project_autoload_on_start = 0
 let g:vim_project_auto_detect = 'no'
 let g:vim_project_config = '~/.cache/'
 let g:vim_project_debug = 0
 let g:vim_project_ignore_branch = 1
 let g:vim_project_auto_detect_sign = '.git,.svn'

 let g:vim_project_prompt_mapping = {
  \'open_project': "\<cr>",
  \'close_list':   ["\<esc>", "\<C-c>"],
  \'clear_char':   ["\<bs>", "\<c-a>"],
  \'clear_word':   "\<c-w>",
  \'clear_all':    "\<c-u>",
  \'prev_item':    ["\<c-k>", "\<up>"],
  \'next_item':    ["\<c-j>", "\<down>"],
  \'first_item':   ["\<c-h>", "\<left>"],
  \'last_item':    ["\<c-l>", "\<right>"],
  \'next_view':    "\<tab>",
  \'prev_view':    "\<s-tab>",
  \}
 