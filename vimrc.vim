"----vim 个人使用习惯配置start------
set encoding=UTF-8
" leader设置成空格
let mapleader=" "
" 使用鼠标 启用a
set mouse=c
" 显示行号
set nu
" 相对行号
set relativenumber
"显示左侧图标指示列
set signcolumn =yes
"右侧参考线，超过表示代码太长了，考虑换行
set colorcolumn =120
"split window 从下边和右边出现
set splitbelow
set splitright

" tab=4个空格
set tabstop=4
set shiftwidth=4
" smaller updatetime
set updatetime =300
" 设置 timeoutlen 为等待键盘快捷键连击时间
set timeoutlen =180

" 改变 vim中光标的形状
let g:db_ui_use_nerd_fonts=1
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" 高度光标所在行
"set cursorline
" 设置不换行
"set nowrap
set wrap
" 显示按下的按键
set showcmd
" 按tab显示菜单
set wildmenu
" 不需要备份文件
set nobackup
"----vim 个人使用习惯配置end------
"ssh 远程粘贴板
if executable('clipboard-provider')
    let g:clipboard = {
          \ 'name': 'myClipboard',
          \     'copy': {
          \         '+': 'clipboard-provider copy',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
          \     },
          \     'paste': {
          \         '+': 'clipboard-provider paste',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
          \     },
          \ }
endif
"随机选一个颜色风格
function RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n") 
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

"call RandomColorScheme()

:command NewColor call RandomColorScheme()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
        exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc


func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        elseif &filetype == "python"
                exec "call RunPython()"
        elseif &filetype == "java"
                exec "call CompileJava()"
        endif
endfunc

func! RunResult()
        exec "w"
        if search("mpi\.h") != 0
            exec "!mpirun -np 4 ./%<"
        elseif &filetype == "cpp"
            exec "! ./%<"
        elseif &filetype == "c"
            exec "! ./%<"
        elseif &filetype == "python"
            exec "call RunPython"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc

"map <F5> :call CompileCode()<CR>i
"imap <F5> <ESC>:call CompileCode()<CR>
"vmap <F5> <ESC>:call CompileCode()<CR>

"map <F6> :call RunResult()<CR>


" 文件类型设置 "{{{
" ---------------------------------------------------------------------
" JSX 语法高亮
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx,*.js set filetype=typescriptreact
