set wildmenu
" Other settings.
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set nobackup
set cindent
set cinoptions=:0"
set nocompatible
set autoindent
set ruler
set ai!
set tags=tags;
set autochdir
set tabstop=4

" movement
set scrolloff=7                 " keep 3 lines when scrolling


" show
set ruler                       " show the current row and column
set number                      " show line numbers
set nowrap
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis


" search
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present


" tab
set expandtab                   " expand tabs to spaces
set smarttab
set shiftround

" indent
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4                " insert mode tab and backspace use 4 spaces

" syntax
syntax on

" history : how many lines of history VIM has to remember
set history=2000

colo ron

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    " set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
    cs add cscope.out
    "else search cscope.out elsewhere
    else
    let cscope_file=findfile("cscope.out", ".;")
    let cscope_pre=matchstr(cscope_file, ".*/")
    if !empty(cscope_file) && filereadable(cscope_file)
    exe "cs add" cscope_file cscope_pre
    endif      
    endif
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
	"设置快捷键:

	map <F3> :NERDTreeMirror<CR>
	map <F3> :NERDTreeToggle<CR>
	" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
	"autocmd VimEnter * NERDTree
	" 按下 F2 调出/隐藏 NERDTree
	"map  :silent! NERDTreeToggle
	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config lookupfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable ("./filenametags")
let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent><leader>lk :LUTags<cr>
nmap <silent><leader>ll :LUBufs<cr>
nmap <silent><leader>lw :LUWalk<cr>
		" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
		let _tags = &tags
		try
let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
let tags = taglist(newpattern)
		catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
		return ""
		finally
		let &tags = _tags
		endtry

		" Show the matches for what is typed so far.
		let files = map(tags, 'v:val["filename"]')
		return files
		endfunction
		let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
		
		" CTags{{{
		"2014-7-13
		"默认打开Taglist 
		let Tlist_Auto_Open=1 
		let Tlist_Sort_Type = "name"    
		let Tlist_Compart_Format = 1    
		let Tlist_Exist_OnlyWindow = 1  
		let Tlist_File_Fold_Auto_Close = 0  
		""autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
		let Tlist_Show_One_File=1
		let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
		let Tlist_Show_One_File = 1
		let Tlist_Exit_OnlyWindow = 1 
		let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
		let g:Tlist_Auto_Update=1
		""let Tlist_Process_File_Always=1
		let Tlist_WinWidth=25
		let g:Tlist_Enable_Fold_Column=0
		""let g:Tlist_Auto_Highlight_Tag=1
		"打开changs
		let g:changes_autocmd=1 
		hi DiffAdd term=bold ctermbg=4 guibg=DarkBlue
		""""""""""""""""""""""
		"tagBar
		let g:tagbar_width=30
		let g:tagbar_autofocus=1
		nmap <F7> :TagbarToggle<CR>
		"Ack快捷键设置方式
		map <c-a> :!ack<space>
		map <c-u> :Ack<space>
		"grep
		map <c-g> :!grep<space>
		"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
		"}}}
		" 实用设置{{{
		"""""""""""""""""""""""""""""""""""""""""""""""""""
		"实用设置
        "设置F2打开tlist
        nmap  <F2> :TlistToggle<cr>
        "设置F4打开MRU
        nmap  <F4> :MRU<cr>
	"设置F6打开diffchanges
	nmap  <F6> :DiffChangesDiffToggle<cr>
        " Space to command mode.
        nnoremap <space> :
        vnoremap <space> :

		"当打开vim且没有文件时自动打开NERDTree
		autocmd vimenter * if !argc() | NERDTree | endif
		" 只剩 NERDTree时自动关闭
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
		"}}}
		
		"括号引号自动补全
		inoremap ( ()<Esc>i
		inoremap [ []<Esc>i
		inoremap { {<CR>}<Esc>O
		autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
		inoremap ) <c-r>=ClosePair(')')<CR>
		inoremap ] <c-r>=ClosePair(']')<CR>
		inoremap } <c-r>=CloseBracket()<CR>
		inoremap " <c-r>=QuoteDelim('"')<CR>
		inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
		if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
		else
		return a:char
		endif
		endf

function CloseBracket()
		if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
		else
		return "\<Esc>j0f}a"
		endif
		endf

function QuoteDelim(char)
		let line = getline('.')
		let col = col('.')
		if line[col - 2] == "\\"
		return a:char
		elseif line[col - 1] == a:char
		return "\<Right>"
		else
		return a:char.a:char."\<Esc>i"
		endif
        endf

