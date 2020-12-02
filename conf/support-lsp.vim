" Settings

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'nim': ['nimpretty'],
      \}
let g:ale_open_list = 1
let g:ale_nim_nimpretty_options = '--maxLineLen:100'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_rls_config = {
      \ 'rust': { 'clippy_preference': 'on' }
      \}

" Theme modifications

hi LspDiagnosticsDefaultError guifg=#5c6370 guibg=#282c34
hi LspDiagnosticsFloatingError guifg=#abb2bf guibg=#282c34

" Bindings

nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent> gW <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
