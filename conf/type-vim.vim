" Auto commands

augroup ft_vim
  au!
  au filetype vim setlocal foldmethod=marker spell
  au filetype vim setlocal fo-=o fo-=r
  au filetype vim nnoremap <buffer> <localleader>s :source $MYVIMRC<cr>
augroup end

" Language Server Protocol setup

lua require'lspconfig'.vimls.setup{}
