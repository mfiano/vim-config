" Auto commands

augroup ft_diff
  au!
  au filetype diff setlocal foldmethod=expr
  au filetype diff setlocal foldexpr=DiffFoldLevel()
augroup end
