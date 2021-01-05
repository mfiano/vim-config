call plug#begin('~/.data/nvim/plugins')

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
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'

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

" type: julia
Plug 'JuliaEditorSupport/julia-vim'

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
