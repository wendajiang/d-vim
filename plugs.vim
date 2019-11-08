call plug#begin('~/.vim/plugged')
"------------------
" Code Completions
"------------------
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer --go-completer --rust-completer' }
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"-----------------
" Fast navigation
"-----------------
Plug 'Lokaltog/vim-easymotion'

"------protobuf
Plug 'uarun/vim-protobuf'

"--------------
" Fast editing
"--------------
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'

" Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'


"--------------
" IDE features
"--------------
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'mg979/vim-visual-multi'
Plug 'myusuf3/numbers.vim'

"---------------------
" autoformat
"--------------------"
Plug 'Chiel92/vim-autoformat'
" vim-autoformat need brew install asytle

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------

Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'


"------- Go ----------
Plug 'fatih/vim-go'

"------- c++/c tags---------
Plug 'ludovicchabant/vim-gutentags'

"--------------
" Color Schemes
"--------------
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'patstockwell/vim-monokai-tasty'
" Plug 'sickill/vim-monokai'

Plug 'ybian/smartim'
Plug 'sheerun/vim-polyglot'

Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-obsession'

"--------rust--------
Plug 'rust-lang/rust.vim'

call plug#end()
