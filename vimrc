source ~/.vim/plugs.vim

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

scriptencoding utf-8
set termencoding=utf-8
set encoding=utf-8
set ambiwidth=double

" 设置不在单词中间断行
set lbr
" 打开断行模式对亚洲语言的支持,m表示允许在两个汉字之间断行,即使汉字之间没有空格.B表示将两行合并为一行的时候
" 汉字与汉字之间不要补空格
set fo+=mB

" 设置光标超过78列折行
" set tw=78

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on
set cul "高亮光标所在行
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)
set scrolloff=5     " 光标移动到buffer的顶部和底部时保持5行距离
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
"set foldenable      " 允许折叠
""set foldmethod=manual   " 手动折叠
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
"--------
" Vim UI
"--------
" color scheme
" colorscheme solarized
" colorscheme gruvbox
" colorscheme onedark
" let g:onedark_termcolors=256
colorscheme vim-monokai-tasty
" colorscheme dracula
"set background=dark
"let g:gruvbox_termcolors=16
"colorscheme solarized8
" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" vim-visual-multi插件
let g:Vm_maps = {}
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-n>'           " replace visual C-n
let g:VM_maps["Select l"]           = '<S-Right>'       " start selecting left
let g:VM_maps["Select h"]           = '<S-Left>'        " start selecting right
let g:VM_maps["Select Cursor Down"] = '<M-C-j>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<M-C-k>'        " start selecting up
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'

let g:VM_mouse_mappings = 1
nmap   <D-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <D-RightMouse>        <Plug>(VM-Mouse-Word)
nmap   <M-D-RightMouse>      <Plug>(VM-Mouse-Column)

" 当右键单击窗口的时候，弹出快捷菜单
set mousemodel=popup
" 指定在选择文本时，光标所在位置也属于被选中的范围
set selection=inclusive
set selectmode=mouse,key

" 在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来
set wildmenu

" search
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set ignorecase
set smartcase

" editor settings
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
"set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html

" Default Indentation
" 自动缩进
set autoindent
set smartindent     " indent when
" tab键宽度
set tabstop=4       " tab width
" 统一缩进为4
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" 空格代替制表符
set expandtab       " expand tab to space
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4  colorcolumn=79
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

"au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
"au FileType css setlocal dict+=~/.vim/dict/css.dict
"au FileType c setlocal dict+=~/.vim/dict/c.dict
"au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
"au FileType scale setlocal dict+=~/.vim/dict/scale.dict
"au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/css.dict

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"-----------------
" Plugin settings
"-----------------
" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle


" C++/C 风格设置
" 显示括号配对情况
set sm


" gutentags
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.project', '.maye']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif


" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Tagbar
" autocmd VimEnter * TagbarToggle
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
    let g:tagbar_type_coffee = {
                \ 'ctagsbin' : 'coffeetags',
                \ 'ctagsargs' : '',
                \ 'kinds' : [
                \ 'f:functions',
                \ 'o:object',
                \ ],
                \ 'sro' : ".",
                \ 'kind2scope' : {
                \ 'f' : 'object',
                \ 'o' : 'object',
                \ }
                \ }

    let g:tagbar_type_markdown = {
                \ 'ctagstype' : 'markdown',
                \ 'sort' : 0,
                \ 'kinds' : [
                \ 'h:sections'
                \ ]
                \ }
endif
" tag for go  vim-go plugin 支持
" let g:tagbar_type_go = {
"   \ 'ctagstype' : 'go',
"   \ 'kinds'     : [
"       \ 'p:package',
"       \ 'i:imports:1',
"       \ 'c:constants',
"       \ 'v:variables',
"       \ 't:types',
"       \ 'n:interfaces',
"       \ 'w:fields',
"       \ 'e:embedded',
"       \ 'm:methods',
"       \ 'r:constructor',
"       \ 'f:functions'
"   \ ],
"   \ 'sro' : '.',
"   \ 'kind2scope' : {
"       \ 't' : 'ctype',
"       \ 'n' : 'ntype'
"   \ },
"   \ 'scope2kind' : {
"       \ 'ctype' : 't',
"       \ 'ntype' : 'n'
"   \ },
"   \ 'ctagsbin'  : 'gotags',
"   \ 'ctagsargs' : '-sort -silent'
" \ }

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let mapleader=","
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 剩下的都是非编辑窗口，自动关闭vim
" autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" powerline
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#show_buffers=1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
set completeopt-=preview

" ctrlp
" set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
" nmap <F6> :NERDTreeToggle %<cr>
" 列出当前目录文件
map <F6> :NERDTreeToggle<CR>
imap <F6> <ESC> :NERDTreeToggle<CR>
" 需要vim支持 python2.7
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap <F7> :ALEFix<cr>
nnoremap <leader>v V`]

" gundo 支持python3
if has('python3')
    let g:gundo_prefer_python3 = 1
endif


"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


" easier navigation between file buffer
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap ]B :bfirst<CR>
nnoremap [B :blast<CR>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
            \ if ! exists("g:leave_my_cursor_position_alone") |
            \     if line("'\"") > 0 && line ("'\"") <= line("$") |
            \         exe "normal g'\"" |
            \     endif |
            \ endif

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %


" eggcache vim
" nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

nnoremap <silent> <leader>d :Sbd<cr><cr>
nnoremap <silent> <leader>dm :Sbdm<CR>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab10


"复制到系统粘贴板
vnoremap <C-c> "+y
" 不加上,选中就会
set clipboard-=autoselect

" for tmux
if exists('$TMUX')
    set term=screen-256color
endif

" vim-markdonw-table
let g:table_mode_corner="|"

" youcompleteme
" Override go-to.definition key shortcut to Ctrl-]
" nnoremap <leader>gt :YcmCompleter GoTo<CR>
" 跳转快捷键
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <C-]> :YcmCompleter GoTo<CR>
" nnoremap <g-]> :YcmCompleter GoToDefinition<CR>
" python semantic completion
let g:ycm_python_binary_path='/usr/local/bin/python3'
" C family Completion Path
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" there are some filetypes in ycm default config
let g:ycm_filetype_blacklist = {}

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 在注释中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串中也能补全
let g:ycm_complete_in_strings = 1


let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

" let g:ycm_filetype_whitelist = {
" \ "c":1,
" \ "cpp":1,
" \ "objc":1,
" \ "go":1,
" \ "py":1,
" \ "java":1,
" \ "sh":1,
" \ "zsh":1,
" \ "zimbu":1,
" \ }

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }


" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" vim-go
nnoremap <silent> <leader>gd :GoDebugStart<cr><cr>
au FileType go nmap <leader>r <Plug>(go-run)
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'gopls'
let g:go_info_mode='gopls'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 1

" fzf ripgrep
nnoremap <leader>f :Files<cr>
nnoremap <Leader>a :Rg<Cr>
nnoremap <Leader>s :execute "Rg" expand("<cword>")<CR>
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }



" autoformat cpp file
let g:formatdef_my_cpp = '"astyle --style=attach --pad-oper --lineend=linux"'
let g:formatters_cpp = ['my_cpp']
" au BufWrite * :Autoformat

"" parenthesis auto color match
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"" -------------end '------------------------
let g:rainbow_active = 1

" Check Python files with flake8 and pylint.
" let b:ale_linters = ['pylint', 'flake8']
" Fix Python files with autopep8 and yapf.
" let b:ale_fixers = ['yapf', 'autopep8']
" Disable warnings about trailing whitespace for Python files.
let g:ale_linters = {
            \   'python': ['pylint'],
            \   'json': ['fixjson'],
            \   'cpp': ['cppcheck','clang'],
            \   'go': ['go vet'],
            \}

let g:ale_fixers = {
            \   'python': ['yapf'],
            \   'json': ['fixjson'],
            \   'cpp': ['clang-format'],
            \   'scala': ['scalafmt'],
            \}

let g:ale_fix_on_save = 1

let g:airline#extensions#ale#enabled = 1
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

" rust
" let g:rustfmt_autosave = 1

" hugo last modify time
function! s:UpdateTimestamps()
    let tstamp = strftime('%FT%T%z')
    %s#lastmod: \zs.*\ze#\=tstamp#g
    "%s#^lastmod: \(.*\)$#lastmod: \1=tstamp#g
    echo 'New time: ' . tstamp
endfunction

command! UpdateTimestamps call s:UpdateTimestamps()

" close buffer smart
noremap <leader>x :bp<cr>:bd #<cr>



"禁止生成临时文件
set nobackup
set noswapfile


set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏

" 设置当文件被改动时自动载入
set autoread

if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

        "    elseif &filetype == 'mkd'
        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: ")
        call append(line(".")+2, "  > Mail: ")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include <bits/stdc++.h>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+6, "#include<stdlib.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
