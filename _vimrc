runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"============myself=====================

syntax on                   " 自动语法高亮

colorscheme molokai         " 设定配色方案

set number                  " 显示行号

set ruler                   " 打开状态栏标尺

set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4

set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格

set tabstop=4               " 设定 tab 长度为 4

set nobackup                " 覆盖文件时不备份

set autochdir               " 自动切换当前目录为当前文件所在的目录

filetype plugin indent on   " 开启插件

set backupcopy=yes          " 设置备份时的行为为覆盖

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

"set nowrapscan              " 禁止在搜索到文件两端时重新搜索

set incsearch               " 输入搜索内容时就显示搜索结果

set hlsearch                " 搜索时高亮显示被找到的文本

set noerrorbells            " 关闭错误信息响铃

set novisualbell            " 关闭使用可视响铃代替呼叫

set t_vb=                   " 置空错误铃声的终端代码

" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号

" set matchtime=2             " 短暂跳转到匹配括号的时间

set magic                   " 设置魔术

set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set guioptions-=T           " 隐藏工具栏

set guioptions-=m           " 隐藏菜单栏

set smartindent             " 开启新行时使用智能自动缩进

set backspace=indent,eol,start

                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符

set cmdheight=1             " 设定命令行的行数为 1

set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 

                            " 设置在状态行显示的信息


" return OS type, eg: windows, or linux, mac, et.st..

function! MySys()

    if has("win16") || has("win32") || has("win64") || has("win95")

        return "windows"

    elseif has("unix")

        return "linux"

    endif

endfunction



" 用户目录变量$VIMFILES

if MySys() == "windows"

    let $VIMFILES = $VIM.'/vimfiles'

elseif MySys() == "linux"

    let $VIMFILES = $HOME.'/.vim'

endif



" 设定doc文档目录

let helptags=$VIMFILES.'/doc'



" Buffers操作快捷方式!

"nnoremap <C-RETURN> :bnext<CR>

"nnoremap <C-S-RETURN> :bprevious<CR>



" Tab操作快捷方式!

"nnoremap <C-TAB> :tabnext<CR>

"nnoremap <C-S-TAB> :tabprev<CR>



"关于tab的快捷键

" map tn :tabnext<cr>

" map tp :tabprevious<cr>

" map td :tabnew .<cr>

" map te :tabedit

" map tc :tabclose<cr>



"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动

"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的

"时候会变得非常方便.

nnoremap <C-h> <C-w>h

nnoremap <C-j> <C-w>j

nnoremap <C-k> <C-w>k

nnoremap <C-l> <C-w>l



"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）

"nnoremap <leader>1 :set filetype=xhtml<CR>

"nnoremap <leader>2 :set filetype=css<CR>

"nnoremap <leader>3 :set filetype=javascript<CR>

"nnoremap <leader>4 :set filetype=php<CR>



" set fileformats=unix,dos,mac

" nmap <leader>fd :se fileformat=dos<CR>

" nmap <leader>fu :se fileformat=unix<CR>



" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result

" map <C-x>l <ESC>:cl<CR>

" map <C-x>n <ESC>:cn<CR>

" map <C-x>p <ESC>:cp<CR>

" map <C-x>c <ESC>:cc<CR>






" 选中状态下 Ctrl+c 复制

vmap <C-c> "+y







"==================================================================
" plugin - taglist.vim  查看函数列表，需要ctags程序
"==================================================================

" F4 打开隐藏taglist窗口

"-----------------------------------------------------------------

"if MySys() == "windows"                " 设定windows系统中ctags程序的位置
"
"    let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
"
"elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置
"
"    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"
"endif
"
"nnoremap <silent><F4> :TlistToggle<CR>
"
"let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
"
"let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
"
"let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
"
"let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
"
"let Tlist_Auto_Open = 0
"
"let Tlist_Auto_Update = 1
"
"let Tlist_Hightlight_Tag_On_BufEnter = 1
"
"let Tlist_Enable_Fold_Column = 0
"
"let Tlist_Process_File_Always = 1
"
"let Tlist_Display_Prototype = 0
"
"let Tlist_Compact_Format = 1






"==================================================================
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
"==================================================================

" \m  mark or unmark the word under (or before) the cursor

" \r  manually input a regular expression. 用于搜索.

" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .

" \*  当前MarkWord的下一个     \#  当前MarkWord的上一个

" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个







"================================================================
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
"================================================================

" :NERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree

" o 打开关闭文件或者目录         t 在标签页中打开

" T 在后台标签页中打开           ! 执行此文件

" p 到上层目录                   P 到根目录

" K 到第一个节点                 J 到最后一个节点

" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）

" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------

" F3 NERDTree 切换

map <F3> :NERDTreeToggle<CR>

imap <F3> <ESC>:NERDTreeToggle<CR>

let NERDChristmasTree = 1
let NERDTreeAutoCenter = 1
let NERDTreeBookmarksFile = $VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowFiles = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeWinPos = 'left'
let NERDTreeWinSize = 31




"==============================================================
" plugin - NERD_commenter.vim   注释代码用的，
"==============================================================

" [count],cc 光标以下count行逐行添加注释(7,cc)

" [count],cu 光标以下count行逐行取消注释(7,cu)

" [count],cm 光标以下count行尝试添加块注释(7,cm)

" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。

" 注：count参数可选，无则默认为选中行或当前行

"-----------------------------------------------------------------

"let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格

"let NERDCompactSexyComs=1   " 多行注释时样子更好看






"========================================================================
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"========================================================================

"let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"

"let g:DoxygenToolkit_briefTag_funcName="yes"

"map <leader>da :DoxAuthor<CR>

"map <leader>df :Dox<CR>

"map <leader>db :DoxBlock<CR>

"map <leader>dc a /*  */<LEFT><LEFT><LEFT>







"====================================================================
" plugin - NeoComplCache.vim    自动补全插件
"====================================================================
source $VIM/vimfiles/neocomplcache.conf




"=====================================================================
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
“====================================================================
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾






"=====================================================================
" plugin - vcscommand.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" SVN/git管理工具
"=====================================================================





"=================================================================
" plugin – a.vim 在头文件和实现文件间快速切换
"=================================================================
"press Ctrl+^ or input :e# to switch





"=================================================================
" plugin - Tagbar.vim 类似taglist的插件，对面向对象语言支持更好
"=================================================================
nmap <F8> :TagbarToggle<CR> 
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30




