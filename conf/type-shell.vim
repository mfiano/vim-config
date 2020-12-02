" Auto commands

augroup ft_shell
  au!
  au filetype sh setlocal foldmethod=marker
augroup end

" Language Server Protocol setup

lua require'lspconfig'.bashls.setup{}
