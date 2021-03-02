" Builtin Neovim settings

set autochdir
set backup
set backupdir=~/.cache/nvim/backup//
set clipboard=unnamedplus
set colorcolumn=+1
set complete+=k
set completeopt=noinsert,menuone,noselect
set cursorline
set dictionary=/usr/share/dict/words
set directory=~/.cache/nvim//swap//
set expandtab
set fillchars=vert:\┃,diff:•,fold:-
set foldlevelstart=0
set formatoptions=tcqnj
set gdefault
set hidden
set ignorecase
set lazyredraw
set matchpairs+=<:>
set matchtime=3
set modelines=0
set mouse=a
set noshowmode
set nosplitbelow
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
set smartcase
set smartindent
set softtabstop=2
set spellfile=~/.vim/spell/custom.utf-8.add
set splitright
set synmaxcol=200
set tabstop=2
set termencoding=utf-8
set termguicolors
set textwidth=100
set timeoutlen=350
set title
set undodir=~/.cache/nvim/undo//
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

" Ensure any required directories exist.

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Miscellaneous plugin settings

let g:incsearch#auto_nohlsearch = 1
let g:neoyank#file = '~/.cache/nvim/neoyank'

let delimitMate_quotes = "\" '"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_jump_expansion = 1
