" Settings

let g:go_code_completion_enabled = 0
let g:go_test_show_name = 1
let g:go_doc_keywordprg_enabled = 0

" Language Server Protocol support

lua require'lspconfig'.gopls.setup{}
