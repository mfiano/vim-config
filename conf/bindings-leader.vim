" Settings

let g:leader_map = {}
let g:mapleader = "\<space>"
let g:maplocalleader = ","
call which_key#register('<space>', "g:leader_map")

" Bindings

nnoremap <silent> <leader> :WhichKey '<space>'<cr>
vnoremap <silent> <leader> :<c-u>WhichKey '<space>'<cr>
nnoremap <silent> <localleader> :WhichKey ','<cr>
vnoremap <silent> <localleader> :<c-u>WhichKey ','<cr>

let g:leader_map.b = {
      \ 'name': '+buffer',
      \ 'b': 'switch-buffer',
      \ 'd': 'delete-buffer',
      \ '[': 'previous-buffer',
      \ ']': 'next-buffer'
      \ }
nnoremap <leader>bb :FzfBuffer<cr>
nnoremap <leader>bd :Bwipeout<cr>
nnoremap <leader>b[ :bprevious<cr>
nnoremap <leader>b] :bnext<cr>

let g:leader_map.c = {
      \ 'name': '+code',
      \ 'd': 'go-to-definition',
      \ 'h': 'hover',
      \ 'r': 'find-references',
      \ 't': 'go-to-type-definition'
      \ }
nnoremap <leader>cd :ALEGoToDefinition<cr>
nnoremap <leader>ch :ALEHover<cr>
nnoremap <leader>cr :ALEFindReferences<cr>
nnoremap <leader>ct :ALEGoToTypeDefinition<cr>

let g:leader_map.e = {
      \ 'name': '+edit',
      \ ';': 'insert-semi-colon',
      \ 'm': 'multi-edit'
      \ }
nnoremap <leader>e; m'A;<esc>``
nnoremap <leader>em :CtrlSF<cr>

let g:leader_map.f = {
      \ 'name': '+file',
      \ 'd': 'delete-file',
      \ 'f': 'find-file',
      \ 'h': 'home-files',
      \ 'i': 'edit-project-ideas',
      \ 'p': 'project-files',
      \ 'r': 'recent-files',
      \ 'R': 'rename-file',
      \ 's': 'save-file',
      \ 'S': 'sudo-save-file',
      \ 't': 'file-tree',
      \ 'v': 'edit-vimrc',
      \ 'V': 'edit-vimrc-split'
      \ }
nnoremap <leader>fd :Delete<cr>
nnoremap <leader>ff :FzfFiles<cr>
nnoremap <leader>fh :FzfFiles ~<cr>
nnoremap <leader>fi :call GitEditRootFile("ideas.md")<cr>
nnoremap <leader>fp :call FzfProjectFiles()<cr>
nnoremap <leader>fr :FzfHistory<cr>
nnoremap <leader>fR :Rename
nnoremap <leader>fs :w!<cr>
nnoremap <leader>fS :SudoWrite<cr>
nnoremap <leader>ft :Fern . -drawer -toggle<cr>
nnoremap <leader>fv :e $MYVIMRC<cr>
nnoremap <leader>fV :vsplit $MYVIMRC<cr>

let g:leader_map.g = {
      \ 'name': '+git',
      \ 'c': 'commits',
      \ 'C': 'buffer-commits',
      \ 'g': 'gist',
      \ 'G': 'gist-private',
      \ 's': 'git-status',
      \ 'w': 'git-web-browse'
      \ }
nnoremap <leader>gc :FzfCommits<cr>
nnoremap <leader>gC :FzfBCommits<cr>
nnoremap <leader>gg :Gist -P<cr>
vnoremap <leader>gg :Gist -P<cr>
nnoremap <leader>gG :Gist -p<cr>
vnoremap <leader>gG :Gist -p<cr>
nnoremap <leader>gw :Gbrowse<cr>

let g:leader_map.s = {
      \ 'name': '+search',
      \ ';': 'command-history',
      \ '/': 'search-history',
      \ 'm': 'marks',
      \ 'p': 'project-files',
      \ 's': 'spelling',
      \ 't': 'buffer-tags',
      \ 'T': 'project-tags'
      \ }
nnoremap <leader>s; :FzfHistory:<cr>
nnoremap <leader>s/ :FzfHistory/:<cr>
nnoremap <leader>sm :FzfMarks<cr>
nnoremap <leader>ss :call FzfSpell()<cr>
nnoremap <leader>sp :FzfProjectRg<cr>
nnoremap <leader>st :FzfBTags<cr>
nnoremap <leader>sT :FzfTags<cr>

let g:leader_map.t = {
      \ 'name': '+toggle',
      \ 'h': 'search-highlights',
      \ 'i': 'indent-guides',
      \ 'n': 'line-numbers',
      \ }
nnoremap <leader>th :nohls<cr>
nnoremap <leader>ti :IndentLinesToggle<cr>
nnoremap <leader>tn :setl number!<cr>

let g:leader_map.w = {
      \ 'name': '+window',
      \ '-': 'split-horizontal',
      \ '|': 'split-vertical',
      \ '=': 'rebalance',
      \ 'd': 'window-delete',
      \ 's': 'window-swap',
      \ 't': 'tab-new',
      \ 'T': 'tab-close',
      \ 'w': 'switch-window'
      \ }
nnoremap <leader>w- :split<cr>
nnoremap <leader>w\| :vsplit<cr>
nnoremap <leader>w= <c-w>=
nnoremap <leader>wd :close<cr>
nnoremap <leader>ws <c-w>R
nnoremap <leader>wt :tab split<cr>
nnoremap <leader>wT :tabclose<cr>
nnoremap <leader>ww :FzfWindows<cr>
