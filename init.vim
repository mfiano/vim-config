" Plugins {{{
call plug#begin('~/.data/nvim/plugins')
Plug 'nvim-lua/popup.nvim' " Pop-up window API
Plug 'nvim-lua/plenary.nvim' " Utility functions
Plug 'mattn/webapi-vim' " Web API support required by some plugins
Plug 'nvim-telescope/telescope.nvim' " UI for finding things
Plug 'nvim-telescope/telescope-project.nvim' " Telescope extension for finding projects
Plug 'airblade/vim-rooter' " Sets working directory to project root when opening files
Plug 'sheerun/vim-polyglot' " Support for multiple languages
Plug 'ntpeters/vim-better-whitespace' "  Strip end of line white space when saving a file
Plug 'moll/vim-bbye' " Delete buffers without changing window layout
Plug 'farmergreg/vim-lastplace' " Remember cursor position in file across Vim instances
Plug 'wellle/targets.vim' " Additional Vim text objects
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Language parsing
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'kyazdani42/nvim-web-devicons' " Icons
Plug 'glepnir/galaxyline.nvim' " Status line
Plug 'romgrk/barbar.nvim' " Tab bar
Plug 'kyazdani42/nvim-tree.lua' " File browser
Plug 'joshdick/onedark.vim' " Color theme
Plug 'lewis6991/gitsigns.nvim' " Show git change indicators in the sign column
Plug 'f-person/git-blame.nvim' " Show git blame message for current line
Plug 'psliwka/vim-smoothie' " Smooth scrolling
Plug 'unblevable/quick-scope' " Highlight letters to jump to when starting a f, F, t, or T motion
Plug 'RRethy/vim-illuminate' " Highlight all occurrences of the symbol under the cursor
Plug 'machakann/vim-highlightedyank' " Flash regions when yanking text
Plug 'w0rp/ale' " Code linting engine
Plug 'kshenoy/vim-signature' " Show Vim mark names in the sign column
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'} " Show indentation guides
Plug 'tpope/vim-repeat' " Support for repeating more commands
Plug 'tpope/vim-surround' " Bindings for surrounding text
Plug 'chaoren/vim-wordmotion' " Extend Vim's definition of a 'word' to camel-case and more
Plug 'liuchengxu/vim-which-key' " Key binding guide
Plug 'rust-lang/rust.vim' " Language support: Rust
Plug 'racer-rust/vim-racer' " Language support: Rust
Plug 'timonv/vim-cargo' " Language support: Rust
Plug 'cespare/vim-toml' " Language support: TOML
Plug 'maralla/vim-toml-enhance' " Language support: TOML
Plug 'plasticboy/vim-markdown' " Language support: Markdown
Plug 'rhysd/vim-gfm-syntax' " Language support GitHub-flavored Markdown
Plug 'JuliaEditorSupport/julia-vim' " Language support: Julia
Plug 'elzr/vim-json' " Language support: JSON
Plug 'fatih/vim-go' " Language support: Go
Plug 'iamcco/vim-language-server' " Language support: Vim script
Plug 'bash-lsp/bash-language-server' " Language support: Bash
Plug 'othree/html5.vim' " Language support: HTML
Plug 'alvan/vim-closetag' " Automatically close HTML tags
Plug 'othree/csscomplete.vim' " Language support: CSS
Plug 'alaviss/nim.nvim' " Language support: Nim
Plug 'neovim/nvim-lspconfig' " Language Server Protocol support
Plug 'tjdevries/lsp_extensions.nvim' " Language Server Protocol support
Plug 'glepnir/lspsaga.nvim' " Language Server Protocol support
Plug 'b3nj5m1n/kommentary' " Code commenting
Plug 'junegunn/vim-peekaboo' " Vim register guide
Plug 'mattn/gist-vim' " Allow publishing GitHub gists of current buffer/region
Plug 'haya14busa/incsearch.vim' " Incremental search
Plug 'haya14busa/incsearch-fuzzy.vim' " Incremental search
Plug 'tpope/vim-eunuch' " Vim commands for UNIX shell commands
Plug 'tpope/vim-fugitive' " Git integration
Plug 'TimUntersberger/neogit' " Git interface
Plug 'tpope/vim-rhubarb' " GitHub integration
Plug 'phaazon/hop.nvim' " Quickly jump to any word or line in a buffer
Plug 'hrsh7th/nvim-compe' " Completion system
Plug 'voldikss/vim-floaterm' " Interact with floating windows
Plug 'ojroques/vim-oscyank' " Allow copying text to the local system clipboard across SSH
call plug#end()
" }}}

" General Settings
" Neovim options {{{
set autochdir
set backup
set backupdir=$XDG_CACHE_HOME/nvim/backup//
set clipboard=unnamedplus
set colorcolumn=+1
set complete+=k
set completeopt=noinsert,menuone,noselect
set cursorline
set dictionary=/usr/share/dict/words
set directory=$XDG_CACHE_HOME/nvim//swap//
set expandtab
set fileencoding=utf-8
set fillchars=vert:\┃,diff:•,fold:-
set foldlevelstart=0
set formatoptions=tcqnj
set gdefault
set hidden
set ignorecase
set iskeyword+=-
set lazyredraw
set matchpairs+=<:>
set matchtime=3
set modelines=0
set mouse=a
set noshowmode
set noswapfile
set nowrap
set number
set scrolloff=3
set shiftround
set shiftwidth=2
set shortmess+=cI
set showbreak=↪
set showmatch
set sidescrolloff=4
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set synmaxcol=200
set tabstop=2
set termguicolors
set textwidth=100
set timeoutlen=350
set title
set undodir=$XDG_CACHE_HOME/nvim/undo//
set undofile
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
set wildmode=list:full
" }}}
" Create needed directories {{{
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
" }}}
" Abbreviations {{{
iabbrev todo TODO:
iabbrev _mail mail@mfiano.net
iabbrev _sig Michael Fiano <mail@mfiano.net>
iabbrev _web https://mfiano.net
iabbrev <expr> _date strftime("%Y-%m-%d %H:%M:%S")
" }}}
" Color theme {{{
colorscheme onedark
let g:onedark_terminal_italics=1
" }}}
augroup vim_options " {{{
  au!
  au vimleave * set guicursor=a:hor25
  au bufreadpost quickfix nnoremap <buffer><cr> <cr>
  au winleave,insertenter * set nocursorline
  au winenter,insertleave * set cursorline
  au vimresized * :wincmd =
  au insertenter * :set listchars-=trail:⌴
  au insertleave * :set listchars+=trail:⌴
augroup end " }}}

" File types
augroup ft_commonlisp " {{{
  au!
  au bufread,bufnewfile *.asd,*.ros setfiletype lisp
  au filetype lisp hi link lispKey Keyword
  au filetype lisp setlocal nolisp
augroup end " }}}
augroup ft_css " {{{
  au!
  au filetype css setlocal omnifunc=csscomplete#CompleteCSS noci
augroup end " }}}
augroup ft_diff " {{{
  au!
  au filetype diff setlocal foldmethod=expr
  au filetype diff setlocal foldexpr=DiffFoldLevel()
augroup end " }}}
augroup ft_glsl " {{{
  au!
  au filetype glsl setlocal foldmethod=marker foldmarker={,}
augroup end " }}}
augroup ft_go " {{{
  au!
  lua require'lspconfig'.gopls.setup{}
augroup end
  " }}}
augroup ft_html " {{{
  au!
  au filetype html setlocal foldmethod=indent
augroup end " }}}
augroup ft_json " {{{
  au!
  au filetype json setlocal foldmethod=syntax
augroup end " }}}
augroup ft_julia " {{{
  au!
  lua require'lspconfig'.julials.setup{}
  au filetype julia nnoremap <buffer> <localleader>;
        \ :FloatermNew --name=julia --title=julia\ $1/$2<cr>
augroup end " }}}
augroup ft_markdown " {{{
  au!
  au bufnewfile,bufread *.md setlocal filetype=markdown foldlevel=1
augroup end " }}}
augroup ft_nim " {{{
  au!
  au filetype nim nnoremap <buffer> <localleader>; \ :FloatermNew --name=nim --title=nim\ $1/$2<cr>
  au filetype nim nnoremap <buffer> <localleader>b
        \ :FloatermSend --name=nim nim c -r --verbosity:2 --hints:off --outdir:build %:p<cr>
        \:FloatermHide!<cr>
        \:FloatermShow nim<cr>
  au filetype nim nnoremap <buffer> <localleader>B
        \ :FloatermSend --name=nim nim c -r -d:release --verbosity:2 --hints:off
        \ --outdir:build %:p<cr>
        \:FloatermHide!<cr>
        \:FloatermShow nim<cr>
  au filetype nim nnoremap <buffer> <localleader>d
        \ :FloatermSend --name=nim nim doc --project %:p<cr>
        \:FloatermHide!<cr>
        \:FloatermShow nim<cr>
  au filetype nim nnoremap <buffer> <localleader>t
        \ :FloatermSend --name=nim nimble test --outdir:build %:p<cr>
        \:FloatermHide!<cr>
        \:FloatermShow nim<cr>
  au filetype nim setlocal foldmethod=indent fdn=1 formatoptions-=ro tw=100
augroup end " }}}
augroup ft_rust " {{{
  au!
  lua require'lspconfig'.rust_analyzer.setup{}
  au filetype rust nnoremap <localleader>f :RustFmt<cr>
  au filetype rust nnoremap <buffer> <localleader>;
        \ :FloatermNew --name=rust --title=rust\ $1/$2<cr>
  au filetype rust nnoremap <buffer> <localleader>b
        \ :FloatermSend --name=rust cargo build<cr>
        \:FloatermHide!<cr>
        \:FloatermShow rust<cr>
  au filetype rust nnoremap <buffer> <localleader>B
        \ :FloatermSend --name=rust cargo build --release<cr>
        \:FloatermHide!<cr>
        \:FloatermShow rust<cr>
  au filetype rust nnoremap <buffer> <localleader>c
        \ :FloatermSend --name=rust cargo check<cr>
        \:FloatermHide!<cr>
        \:FloatermShow rust<cr>
  au filetype rust nnoremap <buffer> <localleader>r
        \ :FloatermSend --name=rust cargo run<cr>
        \:FloatermHide!<cr>
        \:FloatermShow rust<cr>
  au filetype rust nnoremap <buffer> <localleader>R
        \ :FloatermSend --name=rust cargo run --release<cr>
        \:FloatermHide!<cr>
        \:FloatermShow rust<cr>
  au filetype rust nnoremap <buffer> <localleader>t
        \ :FloatermSend --name=rust cargo test<cr>
        \:FloatermHide!<cr>
        \:FloatermShow rust<cr>
augroup end " }}}
augroup ft_shell " {{{
  au!
  lua require'lspconfig'.bashls.setup{}
  au filetype sh setlocal foldmethod=marker
augroup end " }}}
augroup ft_yaml " {{{
  au!
  au filetype yaml setlocal indentkeys=<:>
augroup end " }}}
augroup ft_vim " {{{
  au!
  lua require'lspconfig'.vimls.setup{}
  au filetype vim setlocal foldmethod=marker spell
  au filetype vim setlocal fo-=o fo-=r
  au filetype vim nnoremap <buffer> <localleader>s :source $MYVIMRC<cr>
augroup end " }}}

" Functions
fun! SmartHome() " {{{
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfun " }}}
fun! CheckBackspace() abort " {{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfun " }}}

" Plugin settings
" ale {{{
let g:ale_nim_nimpretty_options = '--maxLineLen:100'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_rls_config = { 'rust': { 'clippy_preference': 'on' } }
" }}}
" barbar {{{
let bufferline = get(g:, 'bufferline', {})
let bufferline.closable = v:false
let bufferline.maximum_padding = 1
" }}}
" galaxyline {{{
lua require('plugin.galaxyline')
" }}}
" gist-vim {{{
let g:gist_clip_command = 'xclip -selection primary'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1
" }}}
" git-blame {{{
let g:gitblame_enabled = 0
" }}}
" gitsigns {{{
lua require('plugin.gitsigns')
" }}}
" incsearch {{{
let g:incsearch#auto_nohlsearch = 1
" }}}
" indent-blankline {{{
let g:indent_blankline_enabled = v:true
let g:indent_blankline_char = '┊'
let g:indent_blankline_use_treesitter = v:true
" }}}
" kommentary {{{
lua require('plugin.kommentary')
" }}}
" neoterm {{{
let g:neoterm_autoscroll = 1
" }}}
" nvim-compe {{{
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:true
let g:compe.source.tags = v:true
let g:compe.source.snippets_nvim = v:true
let g:compe.source.treesitter = v:true
let g:compe.source.omni = v:true
" }}}
" nvim-tree {{{
let g:nvim_tree_ignore = [ '.git' ]
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_disable_netrw = 1
let g:nvim_tree_hijack_netrw = 1
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
" }}}
" nvim-treesitter {{{
lua require('plugin.nvim-treesitter')
" }}}
" quick-scope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}
" rust.vim {{{
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'
" }}}
" telescope {{{
lua require('telescope').setup{}
" }}}
" telescope-project {{{
lua require'telescope'.load_extension('project')
" }}}
" vim-better-whitespace {{{
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
" }}}
" vim-floaterm {{{
let g:floaterm_wintype = "float"
let g:floaterm_width = 0.9
let g:floaterm_height = 0.35
let g:floaterm_position = "bottom"
let g:floaterm_autoclose = 1
"  }}}
" vim-go {{{
let g:go_code_completion_enabled = 0
let g:go_test_show_name = 1
let g:go_doc_keywordprg_enabled = 0
" }}}
" vim-highlighted-yank {{{
let g:highlightedyank_highlight_duration=250
hi HighlightedyankRegion cterm=reverse gui=reverse
" }}}
" vim-illuminate {{{
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord Visual
augroup END
" }}}
" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
" }}}
" vim-racer {{{
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer = 1
" }}}
" vim-rooter {{{
let g:rooter_silent_chdir = 1
" }}}
" vim-which-key {{{
let g:which_key_timeout = 100
let g:which_key_display_names = { '<cr>': '↵', '<space>': 'SPC' }
let g:which_key_sep = '➜ '
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0
let g:which_key_disable_default_offset = 1
let g:which_key_centered = 0
let g:which_key_map =  {}
let g:which_key_map.b = { 'name': '+buffer' }
let g:which_key_map.b.b = 'switch'
let g:which_key_map.b.d = 'delete'
let g:which_key_map.e = { 'name': '+edit' }
let g:which_key_map.e[';'] = 'insert semi-colon'
let g:which_key_map.e.l = 'jump to line'
let g:which_key_map.e.w = 'jump to word'
let g:which_key_map.f = { 'name': '+file' }
let g:which_key_map.f.d = 'delete file'
let g:which_key_map.f.f = 'find file'
let g:which_key_map.f.h = 'find in home'
let g:which_key_map.f.r = 'find recent'
let g:which_key_map.f.R = 'rename'
let g:which_key_map.f.s = 'save'
let g:which_key_map.f.S = 'sudo save'
let g:which_key_map.f.t = 'toggle file tree'
let g:which_key_map.f.v = 'open vim config'
let g:which_key_map.g = { 'name': '+git' }
let g:which_key_map.g.b = 'toggle blame'
let g:which_key_map.g.c = 'commits'
let g:which_key_map.g.C = 'buffer commits'
let g:which_key_map.g.g = 'gist'
let g:which_key_map.g.G = 'gist private'
let g:which_key_map.g.s = 'status'
let g:which_key_map.g.w = 'git web browse'
let g:which_key_map.p = { 'name': '+project' }
let g:which_key_map.p.f = 'find in project'
let g:which_key_map.p.p = 'switch project'
let g:which_key_map.s = { 'name': '+search' }
let g:which_key_map.s[';'] = 'command history'
let g:which_key_map.s.b = 'search buffer'
let g:which_key_map.s.d = 'search directory'
let g:which_key_map.s.m = 'marks'
let g:which_key_map.s.p = 'search project'
let g:which_key_map.s.s = 'spelling'
let g:which_key_map.t = { 'name': '+toggle' }
let g:which_key_map.t.h = 'search highlight'
let g:which_key_map.t.i = 'indent guides'
let g:which_key_map.t.n = 'line numbers'
let g:which_key_map.w = { 'name': '+window' }
let g:which_key_map.w['-'] = 'split horizontal'
let g:which_key_map.w['|'] = 'split vertical'
let g:which_key_map.w['='] = 'rebalance'
let g:which_key_map.w.d = 'delete'
let g:which_key_map.w.s = 'swap'
let g:which_key_map.w.t = 'open tab'
let g:which_key_map.w.T = 'close tab'
call which_key#register('<space>', "g:which_key_map")

augroup which_key
  au! filetype which_key
  au filetype which_key set laststatus=0 noruler | au bufleave <buffer> set laststatus=2 ruler
augroup end
" }}}

" Key bindings
" Global {{{

" Allow entering commands quicker with ; instead of :
nnoremap ; :

" Disable help key
noremap <f1> <nop>
inoremap <f1> <nop>

" Close a window quickly with Q
nnoremap Q :q<cr>

" Yank to end of line with Y instead of y$
nnoremap Y y$

" Tab management
nnoremap <a-1> 1gt
nnoremap <a-2> 2gt
nnoremap <a-3> 3gt
nnoremap <a-4> 4gt
nnoremap <a-5> 5gt
nnoremap <a-6> 6gt
nnoremap <a-7> 7gt
nnoremap <a-8> 8gt
nnoremap <a-9> 9gt

" Insert a new line when pressing Return in normal mode
nnoremap <cr> o<esc>

" Switch windows with Shift + arrow keys
nnoremap <s-up> <c-w><c-k>
nnoremap <s-down> <c-w><c-j>
nnoremap <s-left> <c-w><c-h>
nnoremap <s-right> <c-w><c-l>
tnoremap <s-up> <c-\><c-n><c-w><c-w>

" Better indenting of visual selection
vnoremap < <gv
vnoremap > >gv

" Move selected lines with Alt + Up/Down
xnoremap <a-up> :move '<-2<cr>gv-gv
xnoremap <a-down> :move '>+1<cr>gv-gv

" Tab completion selection
inoremap <silent> <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent> <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Equalize window sizes
nnoremap - :wincmd =<cr>

" Alternate between first column and first non-blank character of the line with the Home key
noremap <expr> <silent> <home> SmartHome()
imap <silent> <home> <c-o><home>

" Open folds with Tab
nnoremap <tab> za
vnoremap <tab> za

" Language Server Protocol
nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<cr>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<cr>
nnoremap <silent> ga :Lspsaga code_action<cr>
vnoremap <silent> ga :<c-u>Lspsaga range_code_action<cr>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gh :Lspsaga lsp_finder<cr>
nnoremap <silent> gR :Lspsaga rename<cr>
nnoremap <silent> gs :Lspsaga signature_help<cr>
nnoremap <silent> K :Lspsaga hover_doc<cr>
nnoremap <silent> <a-d> :Lspsaga open_floaterm<cr>
tnoremap <silent> <a-d> <c-\><c-n>:Lspsaga close_floaterm<cr>

" Leader keys
let g:mapleader = ' '
let g:maplocalleader = ","
nnoremap <space> <nop>
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<space>'<cr>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<space>'<cr>
nnoremap <silent> <localleader> :silent <c-u> :silent WhichKey ','<cr>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual ','<cr>

" Incremental searching
map / <plug>(incsearch-forward)
map ? <plug>(incsearch-backward)
map n <plug>(incsearch-nohl-n)
map N <plug>(incsearch-nohl-N)

nnoremap <silent> <leader>tt :FloatermToggle<cr>
tnoremap <silent> <leader>tt <c-\><c-n>:FloatermToggle<cr>
" }}}
" Leader {{{
nnoremap <leader>bb :Telescope buffers<cr>
nnoremap <leader>bd :Bwipeout<cr>
nnoremap <leader>e; m'A;<esc>``
nnoremap <leader>el :HopLine<cr>
nnoremap <leader>ew :HopWord<cr>
vnoremap <leader>ey :OSCYank<cr>
nnoremap <leader>fd :Delete<cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fh :Telescope find_files cwd=~<cr>
nnoremap <leader>fr :Telescope oldfiles<cr>
nnoremap <leader>fR :Rename<space>
nnoremap <leader>fs :w!<cr>
nnoremap <leader>fS :SudoWrite<cr>
nnoremap <leader>ft :NvimTreeToggle<cr>
nnoremap <leader>fv :e $MYVIMRC<cr>
nnoremap <leader>gb :GitBlameToggle<cr>
nnoremap <leader>gc :Telescope git_commits<cr>
nnoremap <leader>gC :Telescope git_bcommits<cr>
nnoremap <leader>gg :Gist! -P<cr>
vnoremap <leader>gg :Gist! -P<cr>
nnoremap <leader>gG :Gist! -p<cr>
vnoremap <leader>gG :Gist! -p<cr>
nnoremap <leader>gs :Neogit<cr>
nnoremap <leader>gw :Gbrowse<cr>
nnoremap <leader>pf :Telescope git_files<cr>
nnoremap <leader>pp :Telescope project<cr>
nnoremap <leader>s; :Telescope command_history<cr>
nnoremap <leader>sb :Telescope current_buffer_fuzzy_find<cr>
nnoremap <expr> <leader>sd ':Telescope live_grep cwd='.expand('%:p:h').'/<cr>'
nnoremap <leader>sm :Telescope marks<cr>
nnoremap <leader>sp :Telescope live_grep<cr>
nnoremap <leader>ss :Telescope spell_suggest<cr>
nnoremap <leader>th :nohls<cr>
nnoremap <leader>ti :IndentBlanklineToggle<cr>
nnoremap <leader>tn :setl number!<cr>
nnoremap <leader>w- :split<cr>
nnoremap <leader>w\| :vsplit<cr>
nnoremap <leader>w= <c-w>=
nnoremap <leader>wd :close<cr>
nnoremap <leader>ws <c-w>R
nnoremap <leader>wt :tab split<cr>
nnoremap <leader>wT :tabclose<cr>
" }}}