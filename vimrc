"
" Personal preference .vimrc file
" Maintained by Vincent Driessen <vincent@datafox.nl>
"
" My personally preferred version of vim is the one with the "big" feature
" set, in addition to the following configure options:
"
"    ./configure	--with-features=huge --enable-multibyte
"			--enable-rubyinterp=yes --enable-pythoninterp=yes 
"			--with-python-config-dir=/usr/lib/python2.7/config 
"			--enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.5/config 
"			--enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope  
"			--prefix=/usr/local
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"

set nocompatible				" Disable vi compatibility

" ----------------------------------------------
" Pathogen Manager
" ----------------------------------------------
source ~/.vim/bundle/quicktex/plugin/quicktex.vim
execute pathogen#infect()		


" ----------------------------------------------
" Behaviour
" ----------------------------------------------

filetype plugin indent on			" Enable detection, plugins and indent	
syntax on					" syntax highlight on			
filetype off					" force reloading *after* pathogen loaded
set shell=/usr/bin/zsh				" Vim expects a POSIX-compliant shell, 
						" specify a shell for vim
set term=xterm-256color
set t_Co=256					" 256 colors terminal
let mapleader=","				" Change the mapleader (easier to type) from \ to,
let maplocalleader=";"				" (easier to type) from \ to ...


" ----------------------------------------------
" Editing Behaviour
" ----------------------------------------------

set showmode					" always show what mode we're currently editing in
set nowrap					" don't wrap lines
set tabstop=4					" a tab is four spaces
set softtabstop=4				" when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab					" expand tabs by default (overloadable per file type later)
set shiftwidth=4				" number of spaces to use for autoindenting
set shiftround                  		" use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  		" allow backspacing over everything in insert mode
set autoindent                  		" always set autoindenting on
set smartindent					" automatically inserts one extra level of indentation in some cases
set copyindent                  		" copy the previous indentation on autoindenting
set number                      		" always show line numbers
set showmatch                   		" set show matching parenthesis
set ignorecase                  		" ignore case when searching
set smartcase                   		" ignore case if search pattern is all lowercase,
                                		" case-sensitive otherwise
set smarttab                    		" insert tabs on the start of a line according to
                                		" shiftwidth, not tabstop
set scrolloff=4                 		" keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             		" allow the cursor to go in to "invalid" places
set hlsearch                    		" highlight search terms
set incsearch                   		" show search matches as you type
set gdefault                    		" search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

set nolist                      		" don't show invisible characters by default,
                                		" but it is enabled for some file types (see later)
set pastetoggle=<F2>            		" when in insert mode, press <F2> to go to
                                		" paste mode, where you can paste mass data
                                		" that won't be autoindented
"set mouse=a                     		" enable using the mouse if terminal emulator
                                		" supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1				" When wrapping paragraphs, don't end lines
						" with 1-letter words (looks stupid)

set nrformats=					" make <C-a> and <C-x> play well with
						" zero-padded numbers (i.e. don't consider
						" them octal or hex)

set shortmess+=I				" hide the launch screen
set clipboard=unnamed				" normal OS clipboard interaction
set autoread					" automatically reload files changed outside of Vim

set updatetime=1000				" Speed up the updatetime so gitgutter and friends are quicker

set ttyfast					" Make the keyboard faaaaaaast
"set timeout timeoutlen=1000 ttimeoutlen=50

nnoremap <leader>I :set list!<cr>		" Toggle show/hide invisible chars	
nnoremap <leader>N :setlocal number!<cr>	" Toggle line numbers

" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
"nnoremap / /\v
"vnoremap / /\v

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

nnoremap <F5> :NumbersToggle<CR>		" set numbers.vim toggle on F5 between old ones

set modifiable

" ----------------------------------------------
" history / file handling
" ----------------------------------------------

set history=999					" Increase history (default = 20)
set undolevels=999				" Moar undo (default=100)
set autoread					" reload files if changed externally


" ----------------------------------------------
" backup and swap files
" ----------------------------------------------
						" I save all the time, those are annoying and unnecessary...
set nobackup                    		" do not keep backup files, it's 70's style cluttering
set nowritebackup
set noswapfile                  		" do not write annoying intermediate swap files,
                                		" who did ever restore from swap files anyway?


" ----------------------------------------------
" editor layout
" ----------------------------------------------

set termencoding=utf-8
set encoding=utf-8				" The encoding displayed.
set fileencoding=utf-8				" The encoding written to file
"set laststatus=2				" tell VIM to always put a status line in, even
						" if there is only one window
set cmdheight=2					" use a status bar that is 2 rows high
set linespace=3					" space beetween 2 lines


" ----------------------------------------------
" vim-latex-live-preview
" ----------------------------------------------

let g:tex_no_error=1				" remove red highligh for x_2 and x^2
let g:tex_conceal = "0"				" desactivate display unicode latex symbols
let g:livepreview_previewer = 'zathura'
"let g:livepreview_cursorhold_recompile = 0
autocmd Filetype tex setl updatetime=100
nmap <F12> :LLPStartPreview<cr>


" ----------------------------------------------
" vimtex
" ----------------------------------------------

"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'


" ----------------------------------------------
" autosave
" ----------------------------------------------

"let g:auto_save = 1  				" enable AutoSave on Vim startup
"let g:auto_save_no_updatetime = 1		" do not change the 'updatetime' option
"let g:auto_save_in_insert_mode = 0		" do not display the auto-save notification
"let g:auto_save_events = ["InsertLeave", "TextChanged"]
"autocmd TextChanged,TextChangedI <buffer> silent write


" ----------------------------------------------
" ultisnips
" ----------------------------------------------

"nmap <F10> :UltiSnipsEdit<cr>			" Open UltiSnips edit function
"let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"let g:UltiSnipsExpandTrigger = "<tab>"		" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsEditSplit="vertical"


" ----------------------------------------------
" Tagbar
" ----------------------------------------------

nmap <F8> :TagbarToggle<CR>			" Map key F8 to toggle tagbar display


" --- performance / buffer --------------------------------------------------------------
"----------------------------------------------------------------------------------------

set hidden				" can put buffer to the background without writing
					"   to disk, will remember history/marks.
"set lazyredraw				" don't update the display while executing macros
set ttyfast				" Send more characters at a given time.


" --- My defined working IDE-------------------------------------------------------------
"----------------------------------------------------------------------------------------

function OpenMyIDE()
    exec 'NERDTreeToggle'
    "exec 'TagbarToggle'
endfunction


" -----------------------------------------------------------------------------
" --- COMMON STUFF / HELPERS ---
" -----------------------------------------------------------------------------

" Clear the search highlight
"nnoremap <silent> \ :silent nohlsearch<CR>
"nnoremap <esc> :silent! nohls<cr>
nnoremap <CR> :nohlsearch<CR><CR>

" text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
nnoremap <leader>tw gqip
nnoremap <leader>nw :set nowrap<CR>

" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" --- Cycling through tab---
nnoremap <Tab> :bnext<CR>
nnoremap <C-Tab> :bprevious<CR>
noremap <Leader><Left>  :tabmove -1<CR>
noremap <Leader><Right> :tabmove +1<CR>

"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" for xml/html language programming
" iabbrev </ </<C-X><C-O>

" for colorizer -- which shows RGB colors like #ff2311 in your vim editor
" Disable it on startup -- 0
let g:colorizer_startup = 0

" for indent guide lines 
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" # settings for taglist
" Let Tlist be shown on the right
let Tlist_Use_Right_Window = 1 
" Only show one file tags
let Tlist_Show_One_File = 1 
" Start Tlist at first
let Tlist_Auto_Open=0
" Only one tag be open and others keep closed
let Tlist_File_Fold_Auto_Close=1

"=====================================================
"" Vim settings and mappings + You can edit them as you wish
"=====================================================

" Bind key 'Ide' as command to show the IDE user interface
command! -nargs=0 -bar Ide call OpenMyIDE()
" Bind the key in normal usage
"nmap ide :call OpenMyIDE()<CR>


"=====================================================
"" source .virmc (refresh without quit vim)
"=====================================================
 
map <c-r> :source $MYVIMRC<cr>
"autocmd BufWritePost *vimrc,*exrc :call feedkeys(":source %\<cr>")
let @/ = ""				" no more last search highlighting

"=====================================================
"" Tabs / Buffers settings
"=====================================================

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" tab navigation mappings
"map tn :tabn<CR>
"map tp :tabp<CR>
"map tm :tabm 
"map tt :tabnew 
"map ts :tab split<CR>
"map <C-S-Right> :tabn<CR>
"imap <C-S-Right> <ESC>:tabn<CR>
"map <C-S-Left> :tabp<CR>
"imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
"map <M-Right> <c-w>l
"map <M-Left> <c-w>h
"map <M-Up> <c-w>k
"map <M-Down> <c-w>j
"imap <M-Right> <ESC><c-w>l
"imap <M-Left> <ESC><c-w>h
"imap <M-Up> <ESC><c-w>k
"imap <M-Down> <ESC><c-w>j

" show line numbers

" visual autocomplete for command men
"set wildmenu 

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" --- NERDTree ----
nmap ,t :NERDTreeFind<CR>			" open nerdtree with the current file selected
let NERDTreeIgnore=['\.pyc$', '\~$', '\.pyo$', '\.DS_Store'] "ignore files in NERDTree

" Map key F9 to start Tagbar 
nmap <F9> :Ide<CR>


" Airline ----------------------------
" indentLine https://github.com/Yggdroot/indentLine
let g:indentLine_color_term = 239
"let g:indentLine_char = 'c'
"let g:indentLine_char = '|'
"let g:indentLine_char = '│'
"let g:indentLine_char = '┆'
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1
" map <F6> be indentLine.vim toggle
"nnoremap <F6> :IndentLinesToggle<CR>
"map <C-i> :IndentLinesToggle<CR>

" ctrlp settings ----------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0

let [s:lcmap, s:prtmaps] = ['nn <buffer> <silent>', {                                                                                                                                              
    \ 'PrtBS()':              ['<bs>', '<c ]>'],                                                                                                                                               
    \ 'PrtDelete()':          ['<del>'],                                                                                                                                                       
    \ 'PrtDeleteWord()':      ['<c-w>'],                                                                                                                                                       
    \ 'PrtClear()':           ['<c-u>'],                                                                                                                                                       
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],                                                                                                                                             
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],                                                                                                                                               
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],                                                                                                                                           
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],                                                                                                                                             
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],                                                                                                                                       
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],                                                                                                                                   
    \ 'PrtHistory(-1)':       ['<c-n>'],                                                                                                                                                       
    \ 'PrtHistory(1)':        ['<c-p>'],                                                                                                                                                       
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],                                                                                                                                       
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],                                                                                                                                    
    \ 'AcceptSelection("t")': ['<c-t>'],                                                                                                                                                       
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],                                                                                                                                       
    \ 'ToggleFocus()':        ['<s-tab>'],                                                                                                                                                     
    \ 'ToggleRegex()':        ['<c-r>'],                                                                                                                                                       
    \ 'ToggleByFname()':      ['<c-d>'],                                                                                                                                                       
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],                                                                                                                                             
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],                                                                                                                                           
    \ 'PrtExpandDir()':       ['<tab>'],                                                                                                                                                       
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],                                                                                                                                   
    \ 'PrtInsert()':          ['<c-\>'],                                                                                                                                                       
    \ 'PrtCurStart()':        ['<c-a>'],                                                                                                                                                       
    \ 'PrtCurEnd()':          ['<c-e>'],                                                                                                                                                       
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],                                                                                                                                    
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],                                                                                                                                            
    \ 'PrtClearCache()':      ['<F5>'],                                                                                                                                                        
    \ 'PrtDeleteEnt()':       ['<F7>'],                                                                                                                                                        
    \ 'CreateNewFile()':      ['<c-y>'],                                                                                                                                                       
    \ 'MarkToOpen()':         ['<c-z>'],                                                                                                                                                       
    \ 'OpenMulti()':          ['<c-o>'],                                                                                                                                                       
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],                                                                                                                                     
    \ }]                                                                                                                                                                                       

let g:ctrlp_map = '<c-p>'                                                                                                                                                                          
let g:ctrlp_cmd = 'CtrlP'                                                                                                                                                                                                                                                                                                                                                                   
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux                                                                                                                                        
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows  

" Jedi --------------------------------
" jedi settings
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "2"


" Airline settings -----------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0
let g:airline_exclude_preview=1
" airline theme by default it's dark
let g:airline_theme='papercolor'

" powerline的设置 -----------------------------
"
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'unicode'
"let Powerline_symbols='compatible'
"}

"let g:SuperTabRetainCompletionType=2
" 0 – 不记录上次的补全方式
"" 1 – 记住上次的补全方式,直到用其他的补全命令改变它
"" 2 – 记住上次的补全方式,直到按ESC退出插入模式为止
"
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"" 设置按下<Tab>后默认的补全方式, 默认是<C-P>,
"" 现在改为<C-X><C-O>. 关于<C-P>的补全方式,
"" 还有其他的补全方式,
"  你可以看看下面的一些帮助:
"" :help ins-completion
"" :help compl-omni

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" Fix pasting with indent wrong
" Or you can do this to get rid of it      :set paste     after pasting then do :set nopaste  


set background=dark
let g:solarized_termcolors=256
"colorscheme solarized

"let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors

"colorscheme kalisi
"set background=dark

"colorscheme corporation
colorscheme raincode
"colorscheme molokai
"color Tomorrow-Night-Blue
"color dracula
"color onedark

"colorscheme PaperColor
"colorscheme lichen
"colorscheme badwolf	
"colorscheme molokaibis
"let ayucolor="dark"
"colorscheme nord
"colorscheme one-dark

" this fixes backspace not erasing in Vim
set backspace=indent,eol,start " backspace over everything in insert mode

""""""""" Enabling plugin vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

""""""""" For C/C++ project building
" set makeprg=make\ -C\ ../build\ -j9
set makeprg=make\ -j9
nnoremap <F7> :make!<cr>

""""""""" crosshair plugin
" from: https://github.com/bronson/vim-crosshairs
"set cursorline    " enable the horizontal line
"set cursorcolumn  " enable the vertical line
" for settings its color
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NON 
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
