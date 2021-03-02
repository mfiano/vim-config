" Settings

let g:lisp_repl_command = "sbcl-vlime"
let g:vlime_cl_use_terminal = v:true
let g:vlime_enable_autodoc = v:true
let g:vlime_cl_impl = "sbcl"
let g:vlime_window_settings = {
      \ "sldb": { "pos": "belowright", "vertical": v:false },
      \ "xref": { "pos": "belowright", "size": 5, "vertical": v:false },
      \ "repl": { "pos": "belowright", "size": 10, "vertical": v:false },
      \ "inspector": { "pos": "belowright", "vertical": v:false },
      \ "arglist": { "pos": "botright", "size": 1, "vertical": v:false }
      \ }

" Auto commands

augroup ft_commonlisp
  au!
  au bufread,bufnewfile *.asd,*.ros setfiletype lisp
  au filetype lisp hi link lispKey Keyword
  au filetype lisp setlocal nolisp
augroup end

augroup custom_vlime
  au!
  au filetype lisp,vlime_repl,vlime_inspector,vlime_sldb,vlime_notes,vlime_xref,
        \vlime_preview call VlimeMapKeys()
  au filetype lisp setlocal indentexpr=vlime#plugin#CalcCurIndent()
  au filetype lisp nnoremap <buffer> <localleader>rr :call LispReplOpen()<cr>
  au filetype lisp nnoremap <buffer> <localleader>q :call LispReplQuickload()<cr>
  au filetype vlime_repl setlocal nowrap winfixheight
  au filetype vlime_repl nnoremap <buffer> i :call vlime#ui#repl#InspectCurREPLPresentation()<cr>
  au filetype vlime_repl nnoremap <buffer> <2-leftmouse>
        \ :call vlime#ui#repl#InspectCurREPLPresentation()<cr>
  au filetype vlime_sldb setlocal nowrap
  au filetype vlime_sldb nnoremap <buffer> <cr> :call vlime#ui#sldb#ChooseCurRestart()<cr>
  au filetype vlime_inspector nnoremap <buffer> <2-leftmouse>
        \ :call vlime#ui#inspector#InspectorSelect()<cr>
  au filetype vlime_inspector nnoremap <buffer> <cr> :call vlime#ui#inspector#InspectorSelect()<cr>
  au filetype vlime_inspector nnoremap <buffer> p :call vlime#ui#inspector#InspectorPop()<cr>
  au filetype vlime_xref nnoremap <buffer> <cr> :call vlime#ui#xref#OpenCurXref()<cr>
  au filetype vlime_notes nnoremap <buffer> <cr> :call vlime#ui#compiler_notes#OpenCurNote()<cr>
augroup end

" Functions

fun! LispReplOpen()
  vnew
  let g:lisp_repl_job_id = termopen(g:lisp_repl_command)
  call timer_start(2000, { id -> vlime#plugin#ConnectREPL('127.0.0.1', 7002) })
endfun

fun! LispReplQuickload()
  let root = GitFindRoot()
  let systems = split(system('\find ' . root . ' -iname *.asd -exec basename {} .asd \;'))
  if len(systems) == 0
    echom "Could not find any .asd files."
    return
  elseif len(systems) > 1
    echom systems
    echom "Found too many .asd files."
    return
  endif
  call LispReplSend("(ql:quickload :" . systems[0] . ")\n")
endfun

fun! LispReplSend(payload)
  for line in (split(a:payload, '\n'))
    call jobsend(g:lisp_repl_job_id, line . "\n")
  endfor
endfun

fun! VlimeCleanWindows()
  call vlime#plugin#CloseWindow("arglist")
  call vlime#plugin#CloseWindow("notes")
  call vlime#plugin#CloseWindow("preview")
  call vlime#plugin#CloseWindow("repl")
  call vlime#plugin#CloseWindow("threads")
  call vlime#plugin#CloseWindow("xref")
endfun

fun! VlimeMapKeys()
  nnoremap <silent> <buffer> gd :call vlime#plugin#FindDefinition(vlime#ui#CurAtom())<cr>
  nnoremap <silent> <buffer> - :call VlimeCleanWindows()<cr>
endfun
