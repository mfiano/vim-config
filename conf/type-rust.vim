" Settings

let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" Auto commands

augroup ft_rust
  au!
  au filetype rust nnoremap <localleader>f :RustFmt<cr>
  au filetype rust nnoremap <buffer> <localleader>; :call TermNew()<cr>
  au filetype rust nnoremap <buffer> <localleader>b
        \ :T cargo build<cr>
  au filetype rust nnoremap <buffer> <localleader>B
        \ :T cargo build --release<cr>
  au filetype rust nnoremap <buffer> <localleader>c
        \ :T cargo check<cr>
  au filetype rust nnoremap <buffer> <localleader>r
        \ :T cargo run<cr>
  au filetype rust nnoremap <buffer> <localleader>R
        \ :T cargo run --release<cr>
  au filetype rust nnoremap <buffer> <localleader>t
        \ :T cargo test<cr>

" Language Server Protocol setup

lua require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
