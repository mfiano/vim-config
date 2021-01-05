" Settings

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:onedark_terminal_italics=1
let g:echodoc#enable_at_startup = 1
let g:indentLine_enabled = 1
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['gitbranch', 'readonly', 'filename', 'modified']],
      \   'right': [['lineinfo'],
      \             ['percent'],
      \             ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_function': {
      \   'filetype': 'LightlineFileType',
      \   'fileformat': 'LightlineFileFormat',
      \   'gitbranch': 'gitbranch#name',
      \   'lastcompletion': 'LightlineCompletion'
      \ }}

" Theme

colorscheme onedark

" Functions

fun! LightlineCompletion()
  if exists("b:last_completion_sig")
    return b:last_completion_sig
  endif
endfun

fun! LightlineFileType()
  return winwidth(0) > 70 ?
        \ (strlen(&filetype) ? &filetype
        \ . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfun

fun! LightlineFileFormat()
  return winwidth(0) > 70 ?
        \ (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfun
