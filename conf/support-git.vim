" Settings

let g:gist_clip_command = 'xclip -selection primary'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 0

" Functions

fun! GitFindRoot()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfun

fun! GitEditRootFile(file)
  let git_root = GitFindRoot()
  if git_root[0] == "/"
    execute "edit " . git_root . "/" . a:file
  else
    echo "Not a Git repo."
  endif
endfun
