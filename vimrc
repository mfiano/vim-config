" Plugins {{{
set runtimepath+=~/.vim,~/.vim/after
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'othree/csscomplete.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'Shougo/echodoc.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/gist-vim'
Plug 'othree/html5.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'Yggdroot/indentLine'
Plug 'autozimu/LanguageClient-neovim',
      \ {'branch': 'next', 'do': 'bash install.sh'}
Plug 'itchyny/lightline.vim'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'neomake/neomake'
Plug 'Shougo/neomru.vim'
Plug 'kassio/neoterm'
Plug 'Shougo/neoyank.vim'
Plug 'alaviss/nim.nvim'
Plug 'roxma/nvim-yarp'
Plug 'joshdick/onedark.vim'
Plug 'tmsvg/pear-tree'
Plug 'wellle/targets.vim'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-gfm-syntax'
Plug 'itchyny/vim-gitbranch'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'elzr/vim-json'
Plug 'farmergreg/vim-lastplace'
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-peekaboo'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'cespare/vim-toml'
Plug 'maralla/vim-toml-enhance'
Plug 'sodapopcan/vim-twiggy'
Plug 'tpope/vim-unimpaired'
Plug 'liuchengxu/vim-which-key'
Plug 'chaoren/vim-wordmotion'
Plug 'mattn/webapi-vim'
call plug#end()
"}}}

" General {{{
set autochdir
set autoindent
set backup
set backupdir=~/.cache/nvim/backup//
set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set cmdheight=2
set colorcolumn=+1
set complete+=k
set completeopt=noinsert,menuone,noselect
set cursorline
set dictionary=/usr/share/dict/words
set directory=~/.cache/nvim//swap//
set encoding=utf-8
set expandtab
set fillchars=vert:\┃,diff:•,fold:-
set foldlevelstart=0
set formatoptions=tcqnj
set gdefault
set hidden
set history=1000
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set matchpairs+=<:>
set matchtime=2
set modelines=0
set mouse=a
set noerrorbells
set noshowmode
set nosplitbelow
set noswapfile
set nowrap
set number
set ruler
set scrolloff=2
set signcolumn=auto
set shiftround
set shiftwidth=2
set shortmess+=cI
set showbreak=↪
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set softtabstop=4
set spellfile=~/.vim/spell/custom.utf-8.add
set splitright
set synmaxcol=300
set tabstop=4
set termencoding=utf-8
set termguicolors
set textwidth=80
set timeout
set timeoutlen=350
set title
set undodir=~/.cache/nvim/undo//
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=300
set visualbell
set wildignore+=*.swp,*~,.tmp,__pycache__/
set wildignore+=.git/,.hg/,.svn/
set wildignore+=*.exe,*.bin,*.dll,*.o,*.so
set wildignore+=*.elc,*.fasl,*.dx64fsl,*.pyc,*.luac
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png,*.tiff,*.tga
set wildignore+=*.7z,*.bz2,*.dmg,*.gz,*.iso,*.jar,*.rar,*.tar,*.tgz,*.xz,*.zip
set wildignore+=.DS_Store,Thumbs.db
set wildignore+=*.sql,*.sqlite,*.db
set wildignore+=*/target/*
set wildmenu
set wildmode=list:full
set writebackup

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

let g:mapleader = "\<space>"
let g:maplocalleader = ","

hi Search guibg='#61afef' guifg='#000000'

syntax on
colorscheme onedark
"}}}

" Auto commands {{{
augroup fzf
  au!
  if has('nvim')
    au termopen * tnoremap <buffer> <esc> <c-\><c-n>
    au termopen * startinsert
  endif
  au filetype fzf tunmap <buffer> <esc>
augroup end

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
  au focuslost * :wa
augroup end

augroup completion
  au!
  au bufenter * call ncm2#enable_for_buffer()
  au User Ncm2Plugin call ncm2#register_source({
        \   'name': 'nim.nvim',
        \   'priority': 9,
        \   'scope': ['nim'],
        \   'on_complete': {ctx -> nim#suggest#sug#GetAllCandidates({start,
        \ candidates -> ncm2#complete(ctx, start, candidates)})}
        \})
augroup end
"}}}

" Abbreviations {{{
iabbrev todo TODO:
iabbrev _mail mail@michaelfiano.com
iabbrev _sig Michael Fiano <mail@michaelfiano.com>
iabbrev _web https://www.michaelfiano.com
iabbrev <expr> _date strftime("%Y-%m-%d %H:%M:%S")
"}}}

" Functions {{{
fun! GitFindRoot() "{{{
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfun "}}}
fun! GitEditRootFile(file) "{{{
  let git_root = GitFindRoot()
  if git_root[0] == "/"
    execute "edit " . git_root . "/" . a:file
  else
    echo "Not a Git repo."
  endif
endfun "}}}
fun! FzfFloatingWindow() "{{{
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
endfun "}}}
fun! FzfProjectFiles() "{{{
  let root = GitFindRoot()
  execute 'FzfFiles' root
endfun "}}}
" fun! FzfProjectRg {{{
command! -bang -nargs=* FzfProjectRg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case "
  \ .shellescape(<q-args>),
  \1,
  \ { 'dir': GitFindRoot() },
  \ <bang>0
  \ )
"}}}
fun! FzfSpell() "{{{
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({
        \ 'source': suggestions,
        \ 'sink': function("FzfSpellSink"),
        \ 'down': 10,
        \ 'window': 'call FzfFloatingWindow()'
        \ })
endfun "}}}
fun! FzfSpellSink(word) "{{{
  exe 'normal! "_ciw'.a:word
endfun "}}}
fun! LightlineCompletion() "{{{
  if exists("b:last_completion_sig")
    return b:last_completion_sig
  endif
endfun "}}}
fun! LightlineFileType() "{{{
  return winwidth(0) > 70 ?
        \ (strlen(&filetype) ? &filetype
        \ . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfun "}}}
fun! LightlineFileFormat() "{{{
  return winwidth(0) > 70 ?
        \ (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfun "}}}
fun! TermNew() "{{{
  bo 18new
  Tnew
endfun "}}}
fun! s:checkBackspace() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfun "}}}
"}}}

" File types {{{
" Common Lisp {{{
augroup ft_commonlisp
  au!
  au bufread,bufnewfile *.asd,*.ros setfiletype lisp
  au filetype lisp setlocal nolisp
augroup end
"}}}
" CSS {{{
augroup ft_css
  au!
  au filetype css setlocal omnifunc=csscomplete#CompleteCSS noci
augroup end
"}}}
" Diff {{{
augroup ft_diff
  au!
  au filetype diff setlocal foldmethod=expr
  au filetype diff setlocal foldexpr=DiffFoldLevel()
augroup end
"}}}
" GLSL {{{
augroup ft_glsl
  au!
  au filetype glsl setlocal foldmethod=marker foldmarker={,}
augroup end
"}}}
" HTML {{{
augroup ft_html
  au!
  au filetype html setlocal foldmethod=indent
augroup end
"}}}
" JSON {{{
augroup ft_json
  au!
  au filetype json setlocal foldmethod=syntax
augroup end
"}}}
" Markdown {{{
augroup ft_markdown
  au!
  au bufnewfile,bufread *.md setlocal filetype=markdown foldlevel=1
augroup end
"}}}
" Nim {{{
augroup ft_nim
  au!
  au filetype nim nnoremap <buffer> <localleader>; :call TermNew()<cr>
  au filetype nim nnoremap <buffer> <localleader>b
        \ :T nim c -r --verbosity:2 --hints:off --outdir:build %:p<cr>
  au filetype nim setlocal foldmethod=manual
augroup end
"}}}
" Shell  {{{
augroup ft_shell
  au!
  au filetype sh setlocal foldmethod=marker
augroup end
"}}}
" VimL  {{{
augroup ft_vim
  au!
  au filetype vim setlocal foldmethod=marker spell
  au filetype vim setlocal fo-=o fo-=r
  au filetype vim nnoremap <buffer> <localleader>s :source $MYVIMRC<cr>
augroup end
"}}}
" YAML {{{
augroup ft_yaml
  au!
  au filetype yaml setlocal indentkeys=<:>
augroup end
"}}}
"}}}

" Plugin options  {{{
" ale {{{
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'nim': ['nimpretty'],
      \}
let g:ale_open_list = 1
"}}}
" ctrlsf {{{
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_position = 'left'
let g:ctrlsf_auto_focus = { "at": "start" }
"}}}
" echodoc {{{
let g:echodoc#enable_at_startup = 1
"}}}
" fzf {{{
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
"}}}
" gist-vim   {{{
let g:gist_clip_command = 'xclip -selection primary'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1
"}}}
" incsearch {{{
let g:incsearch#auto_nohlsearch = 1
"}}}
" indentLine {{{
let g:indentLine_enabled = 1
"}}}
" lightline {{{
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
"}}}
" ncm2 {{{
let g:ncm2#auto_popup = 0
"}}}
" neomru {{{
let g:neomru#file_mru_path = '~/.cache/nvim/neomru/file'
let g:neomru#directory_mru_path = '~/.cache/nvim/neomru/directory'
"}}}
" neoterm {{{
let g:neoterm_autoscroll = 1
"}}}
" neoyank {{{
let g:neoyank#file = '~/.cache/nvim/neoyank'
"}}}
" netrw {{{
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 1
"}}}
" onedark {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:onedark_terminal_italics=1
"}}}
" pear-tree {{{
let g:pear_tree_repeatable_expand = 0
"}}}
"}}}
" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
"}}}
" vim-signify {{{
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 0
"}}}
" vim-twiggy {{{
let g:twiggy_split_method = 'leftabove'
"}}}
"}}}

" Bindings {{{
" Global bindings {{{
nnoremap ; :
nnoremap <tab> za
vnoremap <tab> za
inoremap <f1> <nop>
nnoremap <f2> :terminal<cr>
nnoremap Q :q<cr>
nnoremap - :wincmd =<cr>
nnoremap <cr> o<esc>
nnoremap <f9> m'ggg?G``
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
nnoremap <silent> K :call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
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
imap <silent><expr> <tab>
      \ pumvisible() ?  "\<c-n>" :
      \ <sid>checkBackspace() ? "\<tab>" :
      \ "\<plug>(ncm2_manual_trigger)"
" imap <tab> <plug>(ncm2_manual_trigger)
" inoremap <c-c> <esc>
" inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")
" inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"}}}
" Leader bindings {{{
let g:leader_map = {}
call which_key#register('<space>', "g:leader_map")
nnoremap <silent> <leader> :WhichKey '<space>'<cr>
vnoremap <silent> <leader> :<c-u>WhichKey '<space>'<cr>
nnoremap <silent> <localleader> :WhichKey ','<cr>
vnoremap <silent> <localleader> :<c-u>WhichKey ','<cr>
" buffer {{{
let g:leader_map.b = {
      \ 'name': '+buffer',
      \ 'b': 'switch-buffer',
      \ 'd': 'delete-buffer',
      \ 'D': 'delete-buffer-force',
      \ '[': 'previous-buffer',
      \ ']': 'next-buffer'
      \ }
nnoremap <leader>bb :FzfBuffer<cr>
nnoremap <leader>bd :Bdelete<cr>
nnoremap <leader>bD :Bwipeout<cr>
nnoremap <leader>b[ :bprevious<cr>
nnoremap <leader>b] :bnext<cr>
"}}}
" edit {{{
let g:leader_map.e = {
      \ 'name': '+edit',
      \ ';': 'insert-semi-colon',
      \ 'm': 'multi-edit'
      \ }
nnoremap <leader>e; m'A;<esc>``
nnoremap <leader>em :CtrlSF<cr>
"}}}
" file {{{
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
nnoremap <leader>fs :w<cr>
nnoremap <leader>fS :SudoWrite<cr>
nnoremap <leader>fv :e $MYVIMRC<cr>
nnoremap <leader>fV :vsplit $MYVIMRC<cr>
"}}}
" git {{{
let g:leader_map.g = {
      \ 'name': '+git',
      \ 'c': 'commits',
      \ 'C': 'buffer-commits',
      \ 'e': 'git-edit',
      \ 'g': 'gist',
      \ 'G': 'gist-private',
      \ 's': 'git-status',
      \ 't': 'git-time-log',
      \ 'w': 'git-web-browse'
      \ }
nnoremap <leader>gc :FzfCommits<cr>
nnoremap <leader>gC :FzfBCommits<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gg :Gist -P<cr>
vnoremap <leader>gg :Gist -P<cr>
nnoremap <leader>gG :Gist -p<cr>
vnoremap <leader>gG :Gist -p<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gt :0Glog<cr>
nnoremap <leader>gw :Gbrowse<cr>
"}}}
" search {{{
let g:leader_map['s'] = {
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
"}}}
" toggle {{{
let g:leader_map.t = {
      \ 'name': '+toggle',
      \ 'h': 'search-highlights',
      \ 'i': 'indent-guides',
      \ 'n': 'line-numbers',
      \ 'q': 'quickfix',
      \ }
nnoremap <leader>th :nohls<cr>
nnoremap <leader>ti :IndentLinesToggle<cr>
nnoremap <leader>tn :setl number!<cr>
nnoremap <leader>tq :call QuickfixToggle()<cr>
"}}}
" window {{{
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
"}}}
"}}}
"}}}
