" Auto commands

augroup strip_whitespace
  au!
  au bufwritepre <buffer> StripWhitespace
augroup end

augroup vim_options
  au!
  au vimleave * set guicursor=a:hor25
  au bufreadpost quickfix nnoremap <buffer><cr> <cr>
  au winleave,insertenter * set nocursorline
  au winenter,insertleave * set cursorline
  au vimresized * :wincmd =
  au insertenter * :set listchars-=trail:⌴
  au insertleave * :set listchars+=trail:⌴
augroup end
