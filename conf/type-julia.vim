" Auto commands

augroup ft_julia
  au!
  au filetype julia nnoremap <buffer> <localleader>; :call TermNew()<cr>

" Language Server Protocol support

lua require'lspconfig'.julials.setup{on_attach=require'completion'.on_attach}
