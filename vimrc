" Plugins {{{

set runtimepath+=~/.vim,~/.vim/after
call plug#begin('~/.vim/plugged')

" general
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-peekaboo'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-eunuch'
Plug 'ntpeters/vim-better-whitespace'
Plug 'moll/vim-bbye'
Plug 'wellle/targets.vim'
Plug 'Shougo/neoyank.vim'
Plug 'kassio/neoterm'
Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

" appearance
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" editing
Plug 'chaoren/vim-wordmotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" git support
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-rhubarb'
Plug 'mattn/gist-vim'

" type: bash
Plug 'bash-lsp/bash-language-server'

" type: common lisp
Plug 'vlime/vlime'

" type: go
Plug 'fatih/vim-go'

" type: misc text/data
Plug 'rhysd/vim-gfm-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'maralla/vim-toml-enhance'
Plug 'elzr/vim-json'

" type: nim
Plug 'alaviss/nim.nvim'

" type: rust
Plug 'timonv/vim-cargo'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" type: vim
Plug 'iamcco/vim-language-server'

" type: webdev
Plug 'othree/html5.vim'
Plug 'othree/csscomplete.vim'
Plug 'mattn/webapi-vim'
Plug 'alvan/vim-closetag'

call plug#end()

"}}}

" General {{{

set autochdir
set autoindent
set autoread
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
set matchtime=3
set modelines=0
set mouse=a
set noerrorbells
set noshowmode
set nosplitbelow
set noswapfile
set nowrap
set number
set ruler
set scrolloff=16
set shiftround
set shiftwidth=2
set shortmess+=cI
set showbreak=↪
set showcmd
set showmatch
set showmode
set sidescrolloff=16
set signcolumn=auto
set smartcase
set smartindent
set softtabstop=2
set spellfile=~/.vim/spell/custom.utf-8.add
set splitbelow
set splitright
set synmaxcol=300
set tabstop=2
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
set wildignore+=*.elc,*.fasl,*.dx64fsl,*.lx64fsl,*.pyc,*.luac
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
  au vimresized * :wincmd =
  au insertenter * :set listchars-=trail:⌴
  au insertleave * :set listchars+=trail:⌴
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

fun! LispReplOpen()
  vnew
  let g:lisp_repl_job_id = termopen(g:lisp_repl_command)
  call timer_start(2000, {
        \ id -> vlime#plugin#ConnectREPL('127.0.0.1', 7002) })
endfun

fun! LispReplQuickload()
  let root = GitFindRoot()
  let systems = split(system('\find ' . root .
        \ ' -iname *.asd -exec basename {} .asd \;'))
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

fun! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfun

fun! TermNew()
  bo 12new
  Tnew
  set wfh
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
  nnoremap <silent> <buffer> gd
        \ :call vlime#plugin#FindDefinition(vlime#ui#CurAtom())<cr>
  nnoremap <silent> <buffer> - :call VlimeCleanWindows()<cr>
endfun


fun! s:check_backspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfun

"}}}

" File types {{{

" Common Lisp
let g:lisp_repl_command = "sbcl-vlime"
augroup ft_commonlisp
  au!
  au bufread,bufnewfile *.asd,*.ros setfiletype lisp
  au filetype lisp hi link lispKey Keyword
  au filetype lisp setlocal nolisp
augroup end

" CSS
augroup ft_css
  au!
  au filetype css setlocal omnifunc=csscomplete#CompleteCSS noci
augroup end

" Diff
augroup ft_diff
  au!
  au filetype diff setlocal foldmethod=expr
  au filetype diff setlocal foldexpr=DiffFoldLevel()
augroup end

" GLSL
augroup ft_glsl
  au!
  au filetype glsl setlocal foldmethod=marker foldmarker={,}
augroup end

" HTML
augroup ft_html
  au!
  au filetype html setlocal foldmethod=indent
augroup end

" JSON
augroup ft_json
  au!
  au filetype json setlocal foldmethod=syntax
augroup end

" Markdown
augroup ft_markdown
  au!
  au bufnewfile,bufread *.md setlocal filetype=markdown foldlevel=1
augroup end

" Nim
augroup ft_nim
  au!
  au filetype nim nnoremap <buffer> <localleader>; :call TermNew()<cr>
  au filetype nim nnoremap <buffer> <localleader>b
        \ :T nim c -r --verbosity:2 --hints:off --outdir:build %:p<cr>
  au filetype nim nnoremap <buffer> <localleader>B
        \ :T nim c -r -d:release --verbosity:2 --hints:off --outdir:build %:p<cr>
  au filetype nim nnoremap <buffer> <localleader>d :T nim doc --project %:p<cr>
  au filetype nim nnoremap <buffer> <localleader>t :T nimble test --outdir:build %:p<cr>
  au filetype nim setlocal foldmethod=indent fdn=1 formatoptions-=ro tw=100
augroup end

" Rust
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

" Shell
augroup ft_shell
  au!
  au filetype sh setlocal foldmethod=marker
augroup end

" VimL
augroup ft_vim
  au!
  au filetype vim setlocal foldmethod=marker spell
  au filetype vim setlocal fo-=o fo-=r
  au filetype vim nnoremap <buffer> <localleader>s :source $MYVIMRC<cr>
augroup end

" YAML
augroup ft_yaml
  au!
  au filetype yaml setlocal indentkeys=<:>
augroup end

"}}}

" Plugin options  {{{

" ale
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

" diagnostic-nvim
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
let g:diagnostic_insert_delay = 1
au CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
au CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }

" echodoc
let g:echodoc#enable_at_startup = 1

" fzf
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

" gist-vim
let g:gist_clip_command = 'xclip -selection primary'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1

" incsearch
let g:incsearch#auto_nohlsearch = 1

" indentLine
let g:indentLine_enabled = 1

" lightline
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

" neoterm
let g:neoterm_autoscroll = 1

" neoyank
let g:neoyank#file = '~/.cache/nvim/neoyank'

" netrw
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 1

" nvim-lspconfig
lua require'lspconfig'.rust_analyzer.setup{}
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.bashls.setup{}
hi LspDiagnosticsDefaultError guifg=#5c6370 guibg=#282c34
hi LspDiagnosticsFloatingError guifg=#abb2bf guibg=#282c34

" onedark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:onedark_terminal_italics=1

" rust.vim
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'

" vim-go
let g:go_code_completion_enabled = 0
let g:go_test_show_name = 1
let g:go_doc_keywordprg_enabled = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" vim-racer
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 0

" vlime
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

augroup custom_vlime
  au!
  au filetype lisp,vlime_repl,vlime_inspector,vlime_sldb,vlime_notes,vlime_xref,
        \vlime_preview call VlimeMapKeys()
  au filetype lisp setlocal indentexpr=vlime#plugin#CalcCurIndent()
  au filetype lisp nnoremap <buffer> <localleader>rr :call LispReplOpen()<cr>
  au filetype lisp nnoremap <buffer> <localleader>q
        \ :call LispReplQuickload()<cr>
  au filetype vlime_repl setlocal nowrap winfixheight
  au filetype vlime_repl nnoremap <buffer> i
        \ :call vlime#ui#repl#InspectCurREPLPresentation()<cr>
  au filetype vlime_repl nnoremap <buffer> <2-leftmouse>
        \ :call vlime#ui#repl#InspectCurREPLPresentation()<cr>
  au filetype vlime_sldb setlocal nowrap
  au filetype vlime_sldb nnoremap <buffer> <cr>
        \ :call vlime#ui#sldb#ChooseCurRestart()<cr>
  au filetype vlime_inspector nnoremap <buffer> <2-leftmouse>
        \ :call vlime#ui#inspector#InspectorSelect()<cr>
  au filetype vlime_inspector nnoremap <buffer> <cr>
        \ :call vlime#ui#inspector#InspectorSelect()<cr>
  au filetype vlime_inspector nnoremap <buffer> p
        \ :call vlime#ui#inspector#InspectorPop()<cr>
  au filetype vlime_xref nnoremap <buffer> <cr>
        \ :call vlime#ui#xref#OpenCurXref()<cr>
  au filetype vlime_notes nnoremap <buffer> <cr>
        \ :call vlime#ui#compiler_notes#OpenCurNote()<cr>
augroup end

"}}}

" Bindings {{{

" Global bindings

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
  \ <sid>check_backspace() ? "\<tab>" :
  \ completion#trigger_completion()
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" LSP
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

" Leader bindings

let g:leader_map = {}
call which_key#register('<space>', "g:leader_map")
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
nnoremap <leader>ft :NERDTreeToggle<cr>
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

"}}}
