" Settings

let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'window': 'call FzfFloatingWindow()' }
let g:fzf_colors = {
      \ 'fg': ['fg', 'Normal'],
      \ 'hl': ['fg', 'Comment'],
      \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+': ['fg', 'Statement'],
      \ 'info': ['fg', 'PreProc'],
      \ 'border': ['fg', 'Ignore'],
      \ 'prompt': ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker': ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header': ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1

" Auto commands

augroup fzf
  au!
  if has('nvim')
    au termopen * tnoremap <buffer> <esc> <c-\><c-n>
    au termopen * startinsert
  endif
  au filetype fzf tunmap <buffer> <esc>
augroup end

" Functions

fun! FzfFloatingWindow()
  let buf = nvim_create_buf(v:false, v:true)
  let height = float2nr(&lines / 2)
  let width = float2nr(&columns / 2)
  let col = float2nr((&columns - width) / 2)
  let row = float2nr((&lines - height) / 2)
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height }
  call setbufvar(buf, '&signcolumn', 'no')
  call nvim_open_win(buf, v:true, opts)
endfun

fun! FzfProjectFiles()
  let root = GitFindRoot()
  execute 'FzfGitFiles' root
endfun

fun! FzfProjectRg(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always
        \ --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind',
        \ 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(options),
        \ a:fullscreen)
endfun
command! -nargs=* -bang FzfProjectRg call FzfProjectRg(<q-args>, <bang>0)

fun! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({
        \ 'source': suggestions,
        \ 'sink': function("FzfSpellSink"),
        \ 'down': 10,
        \ 'window': 'call FzfFloatingWindow()'
        \ })
endfun

fun! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfun
