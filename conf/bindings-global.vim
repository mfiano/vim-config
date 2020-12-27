" Bindings

nnoremap ; :
nnoremap <tab> za
vnoremap <tab> za
noremap <f1> <nop>
inoremap <f1> <nop>
nnoremap <f2> :terminal<cr>
nnoremap Q :q<cr>
nnoremap s :w!<cr>
nnoremap - :wincmd =<cr>
nnoremap <cr> o<esc>
nnoremap <f9> m'ggg?G``
nnoremap <a-t> :tab split<cr>
nnoremap <a-1> 1gt
nnoremap <a-2> 2gt
nnoremap <a-3> 3gt
nnoremap <a-4> 4gt
nnoremap <a-5> 5gt
nnoremap <a-6> 6gt
nnoremap <a-7> 7gt
nnoremap <a-8> 8gt
nnoremap <a-9> 9gt
vnoremap v <plug>(expand_region_expand)
vnoremap <c-v> <plug>(expand_region_shrink)
nnoremap <s-up> <c-w><c-k>
nnoremap <s-down> <c-w><c-j>
nnoremap <s-left> <c-w><c-h>
nnoremap <s-right> <c-w><c-l>
nnoremap z= :call FzfSpell()<cr>
nnoremap z0 :setl foldlevel=0<cr>
nnoremap z1 :setl foldlevel=1<cr>
nnoremap z2 :setl foldlevel=2<cr>
nnoremap z3 :setl foldlevel=3<cr>
nnoremap z4 :setl foldlevel=4<cr>
nnoremap z5 :setl foldlevel=5<cr>
nnoremap Y y$
map / <plug>(incsearch-forward)
map ? <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)
map n <plug>(incsearch-nohl-n)
map N <plug>(incsearch-nohl-N)
map * <plug>(incsearch-nohl-*)
map # <plug>(incsearch-nohl-#)
map g* <plug>(incsearch-nohl-g*)
map g# <plug>(incsearch-nohl-g#)
map z/ <plug>(incsearch-fuzzy-/)
map z? <plug>(incsearch-fuzzy-?)
map zg/ <plug>(incsearch-fuzzy-stay)
noremap <expr> <silent> <home> SmartHome()
imap <silent> <home> <c-o><home>
inoremap <silent><expr> <tab>
  \ pumvisible() ? "\<c-n>" :
  \ CheckBackspace() ? "\<tab>" :
  \ completion#trigger_completion()
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>
