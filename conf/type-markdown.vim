" Settings

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Auto commands

augroup ft_markdown
  au!
  au bufnewfile,bufread *.md setlocal filetype=markdown foldlevel=1
augroup end
