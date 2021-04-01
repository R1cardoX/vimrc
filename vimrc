" *********************************************
" Vbundle插件管理                
" *********************************************
set nocompatible              " required
filetype off                  " required 
   
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()        
"aitline


"文件跳转
"Plugin 'kien/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"" 设置过滤不进行查找的后缀名
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

"Plugin 'vim-scripts/indentpython.vim'
" *********************************************
"nmap <silent> <F3> :TagbarToggle<CR>

"按F3即可打开tagbar界面
"let g:tagbar_ctags_bin = 'ctags'            "tagbar以来ctags插件
"let g:tagbar_width = 22        "设置tagbar的宽度为30列，默认40
"let g:tagbar_autofocus = 1     "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"let g:tagbar_sort = 0         "设置标签不排序，默认排序


Plugin 'skywind3000/gutentags_plus'
Plugin 'ludovicchabant/vim-gutentags'

let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" vim-airline
let g:airline#extensions#tabline#formatter = 'default'
Plugin 'scrooloose/nerdtree'
" *********************************************
" NERD插件属性
" *********************************************
"au vimenter * NERDTree  
let NERDTreeWinSize=22
map <F2> :NERDTreeToggle<CR>  

"设置F2为开启NERDTree的快捷键
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" *********************************************
" 分割布局相关
" *********************************************
set splitbelow
set splitright
"快捷键，ctrl+l切换到左边布局，ctrl+h切换到右边布局
"ctrl+k切换到上面布局，ctrl+j切换到下面布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#formatter = 'default'
set laststatus=2  "永远显示状态栏
"let g:airline#extensions#tabline#enabled = 1 "显示窗口tab和buffer
" 开启powerline字体
let g:airline_powerline_fonts = 1
" 使用powerline包装过的字体
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

Plugin 'Valloric/YouCompleteMe'
let g:ycm_path_to_python_interpreter="/usr/local/bin/python3"
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_server_python_interpreter="/usr/local/bin/python3"

let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf=0      " 关闭加载.ycm_extra_conf.py提示
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tags_files=1                 " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2                     " 从第2个键入字符就开始罗列匹配项
"" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_auto_trigger = 0

function YcmTriggerSwitcher()
    if g:ycm_auto_trigger == 0
        let g:ycm_auto_trigger = 1
    else
        let g:ycm_auto_trigger = 0
    endif
endfunc

nnoremap <C-K> :call YcmTriggerSwitcher()<CR>
nnoremap <C-T> :YcmCompleter GetType<CR>
nnoremap <C-P> :YcmCompleter GoTo<CR>
" *********************************************
" Tomorrow主题配置                
" *********************************************
set t_Co=256
set background=dark
colorscheme Tomorrow-Night

" 开启代码折叠功能
" 根据当前代码行的缩进来进行代码折叠
set foldmethod=indent 
set foldlevel=99

" 将za快捷键映射到space空格键上
nnoremap <space> za
nnoremap m *
nnoremap <c-n> :tn<CR>
nnoremap <c-m> :tp<CR> 
nnoremap <c-\> <c-]><ESC> 
syntax on   "开启语法高亮"
"去掉vi的一致性"
set nocompatible
"显示行号"
set number

set encoding=utf-8
"set encoding=gb2312
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
call vundle#end()                             
filetype plugin indent on
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set wrap |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


"autocmd BufNewFile *.hpp,*.h,*.cc,*.c,*.cpp exec ":call SetTitle()"
"function SetTitle()
"    call setline(1,strftime("// Copyright %Y Baidu Inc. All Rights Reserved."))
"    call setline(2,"// Author : Hao Jiang (jianghao10@baidu.com)")
"    call setline(3,strftime("// Data : %Y/%m/%d"))
"    call setline(4,"//")
"    call setline(5,"// Description: ")
"    call setline(6,"")
"endfunc
"
"autocmd BufNewFile *.py exec ":call SetHeaderTitle()"
"function SetHeaderTitle()
"    call setline(1,strftime("# Copyright %Y Baidu Inc. All Rights Reserved."))
"    call setline(2,"# Author : Hao Jiang (jianghao10@baidu.com)")
"    call setline(3,strftime("# Data : %Y/%m/%d"))
"    call setline(4,"#")
"    call setline(5,"# Description: ")
"    call setline(6,"")
"endfunc
"
set nocompatible
set backspace=indent,eol,start

set tabstop=4                       " number of spaces in a tab 表示一个tab显示出来是多少个空格
set softtabstop=4                   " insert and delete space of <tab> 在编辑的时候，一个tab是多少个空格
set shiftwidth=4                    " number of spaces for indent 每一级缩进是多少个空格
set expandtab                       " expand tabs into spaces  将tab扩展成空格
"set noexpandtab                     " noexpand tabs into spaces  将tab不扩展成空格
set smarttab
set hlsearch
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条"
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set cursorline                  "突出显示当前行"
set cursorcolumn                "突出显示当前列"
set fileencodings=utf-8,gbk,ucs-bom,cp936,gb2312
set tags+=~/.cache/tags/*.tags
