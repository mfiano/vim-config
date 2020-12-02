" Auto commands

augroup ft_nim
  au!
  au filetype nim nnoremap <buffer> <localleader>; :call TermNew()<cr>
  au filetype nim nnoremap <buffer> <localleader>b
        \ :T nim c -r --verbosity:2 --hints:off --outdir:build %:p<cr>
  au filetype nim nnoremap <buffer> <localleader>B
        \ :T nim c -r -d:release --verbosity:2 --hints:off --outdir:build
        \ %:p<cr>
  au filetype nim nnoremap <buffer> <localleader>d :T nim doc --project %:p<cr>
  au filetype nim nnoremap <buffer> <localleader>t :T nimble test
        \ --outdir:build %:p<cr>
  au filetype nim setlocal foldmethod=indent fdn=1 formatoptions-=ro tw=100
augroup end
