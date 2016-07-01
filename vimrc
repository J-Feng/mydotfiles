" Vundle Config {{{
set nocompatible " Not Vi mode compatible, must be the first line
filetype off     " Vundle required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end
" General Plugins {{{
Plugin 'bling/vim-airline'
Plugin 'dongweiming/vary.vim'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/AutoClose'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'SirVer/ultisnips'
" }}}

" Colors {{{
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
" }}}

" Syntaxes {{{
Plugin 'vim-scripts/txt.vim'
" }}}

" Language Special {{{
" C
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/c.vim'
" HTML
Plugin 'mattn/emmet-vim'
" Markdown
Plugin 'suan/vim-instant-markdown'
" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/python_match.vim'
" HTML & JS
Plugin 'maksimr/vim-jsbeautify'
" }}}



" Git plugins not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" Git repos on your local machine
"Plugin 'file:///home/fj/gitroot/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" General Settings {{{

" Enable filetype plugin
syntax on

" A map leader
let mapleader = ","
let g:mapleader = ","

" Set how many lines of history VIM has to remember
set history=1000
" Set to auto read when a file is changed from the outside
set autoread
set autowrite

set backspace=indent,eol,start
set browsedir=current

" give a remind when some operations failed
set confirm

set complete+=k
set whichwrap+=<,>
set hlsearch
set ignorecase
set smartcase
set incsearch
set listchars=tab:>.,eol:$
set number
set printoptions=left:8pc,right:3pc        " print options
set ruler
set showmatch
set matchtime=5
set mouse=a
set novisualbell
set noerrorbells
set t_vb=
set t_Co=256
set showcmd
set wildignore=*.bak,*.o,*.e,*~    " when completion, ignore these extensions
set wildmenu                       " enhanced mode command-line completion
set modeline

set nowrap
set sidescroll=5
set smarttab
set shiftwidth=4   " If smarttab is set, tab at the head of a line will insert shiftwidth, other place use tabstop or softtabstop
set softtabstop=4  " In my vim, a tab is 8 whitespace,  and back space can delete a tab(8 whitespace together)
set tabstop=4      " In other editor, tab is 8 whitespace  XXX: Change this option!!!
set expandtab      " Tab is replaced by whitespaces. To insert a really tab, press C-Q<Tab> in Windows or C-V<Tab> in Linux
set autoindent
set smartindent
set textwidth=0

set splitright
set splitbelow

"set cursorline
"set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set langmenu=zh_CN.UTF-8
set helplang=cn
" Linux
set guifont=YaHei\ Consolas\ Hybrid\ 12
"set guifont=Monaco\ 14
" Mac
"set guifont=Menlo:h15
" Windows
"set guifont=Courier\ 10\ Pitch\ 9
"set guifont=Monospace\ 11

"set autochdir
set nobackup
set nowritebackup
set noswapfile

" Nice statusbar
set laststatus=2
"set statusline=
"set statusline+=%2*%-3.3n%0*\  " Buffer number
"set statusline+=%f\            " File name
"set statusline+=%h%1*%m%r%w%0* " Flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'},  " Filetype
"set statusline+=%{&encoding},  " Encoding
"set statusline+=%{&fileformat}]  " File format
"set statusline+=%=                           " Right align
"set statusline+=%2*0x%-8B\                   " Current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " Offset

" Special statusbar for special windows
if has("autocmd")
	au FileType qf
		\ if &buftype == "quickfix" |
		\     setlocal statusline=%2*%-3.3n%0* |
		\     setlocal statusline+=\ \[Compiler\ Messages\] |
		\     setlocal statusline+=%=%2*\ %<%P |
		\ endif

	fun! <SID>FixMiniBufExplorerTitle()
		if "-MiniBufExplorer-" == bufname("%")
			setlocal statusline=%2*%-3.3n%0*
			setlocal statusline+=\[Buffers\]
		setlocal statusline+=%=%2*\ %<%P
		endif
	endfun

	au BufWinEnter *
		\ let oldwinnr=winnr() |
		\ windo call <SID>FixMiniBufExplorerTitle() |
		\ exec oldwinnr . " wincmd w"
endif

set noimdisable

" Cscope settings
"set cscopetag " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set csto=0
set cscopeverbose " show msg when any other cscope db added

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" Themes
"if has("gui_running")
	colorscheme Tomorrow-Night-Eighties
"else
"	colorscheme Tomorrow-Night-Eighties
"endif
"colorscheme desertEx
"colorscheme xoria256
"colorscheme wombat256
"colorscheme lucius
"colorscheme baycomb
"colorscheme brookstream
"colorscheme inkpot
"colorscheme freya
"colorscheme murphy
" }}}

" Key mappings {{{
" Fast editing of .vimrc
map <silent> <leader>ee :e! ~/.vimrc<CR>
" Fast reloading of .vimrc
map <silent> <leader>ss :source ~/.vimrc<CR>
" Indent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Fast saving
map <silent> <leader>w :w!<CR>
" close window (conflicts with the KDE setting for calling the process manager)
noremap  <C-Esc>       :close<CR>
inoremap  <C-Esc>  <C-C>:close<CR>
" Tab configuration
map <leader>tn :tabnew<CR>
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove<CR>

" Pairs complete
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%

vnoremap  <leader>'  s''<Esc>P<Right>
vnoremap  <leader>"  s""<Esc>P<Right>
vnoremap  <leader>`  s``<Esc>P<Right>

" Fast way to move btween windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Make space in normal mode go down a page
noremap <space> <c-f>

" Function key maps
vnoremap <F2> "+y
noremap <F3> <Esc>"+p
inoremap <F3> <Esc><Esc>"+p
noremap <F5> :%s/$//g<CR>
noremap <silent> <F9>  <Esc>:SyntasticCheck<CR>
inoremap <silent> <F9>  <Esc><Esc>:SyntasticCheck<CR>
noremap <silent> <F10>  <Esc>:NERDTree<CR>
inoremap <silent> <F10>  <Esc><Esc>:NERDTree<CR>
noremap <silent> <F11>  <Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
noremap <silent> <F12>  <Esc>:Tagbar<CR>
inoremap <silent> <F12>  <Esc><Esc>:Tagbar<CR>
"map <C-F12> :!ctags -R --c-kinds=+p --fields=+iaS --extra=+q -f ./tags ./*<CR>
map <C-F12> :!ctags --languages=c --langmap=c:+.c:+.h -R --c-kinds=+p --fields=+iaS --extra=+q -f ./tags ./*<CR>
" cscope
nmap <C-\><C-]> :cstag <C-R>=expand("<cword>")<CR><CR>
" 's'   symbol: find all references to the token under cursor
" 'g'   global: find global definition(s) of the token under cursor
" 'c'   calls:  find all calls to the function name under cursor
" 't'   text:   find all instances of the text under cursor
" 'e'   egrep:  egrep search for the word under cursor
" 'f'   file:   open the filename under cursor
" 'i'   includes: find files that include the filename under cursor
" 'd'   called: find functions that function under cursor calls
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-\>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
" External tools
nmap <leader>jf :%!python3 -m json.tool<CR>  "JSON format
" Emacs key binding
" Move
inoremap <C-a> <Home>
inoremap <C-e> <End>
"inoremap <C-p> <Up>
"inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
"inoremap <M-b> <C-o>b
"inoremap <M-f> <C-o>w
" Rubout word / line and enter insert mode
" use <Esc><Right> instead of <C-o>
inoremap <C-w> <Esc>dbcl
" delete
inoremap <C-u> <Esc>d0cl
inoremap <C-k> <Esc><Right>C
inoremap <C-d> <Esc><Right>s
"inoremap <M-d> <C-o>de
" }}}

" Buffers and Auto Commands {{{
" The current directory is the directory of the file in the current window.
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
" Reload vimrc when it is edited
autocmd! bufwritepost .vimrc source ~/.vimrc

" Indentation in different file types
autocmd FileType python setlocal smarttab shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType cpp setlocal smarttab shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType c setlocal smarttab shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType xml setlocal smarttab shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType java setlocal smarttab shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType text set syntax=txt
autocmd bufNewFile,BufRead set tags+=./tags
" For input method auto switch
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0
" }}}

" Abbreviations {{{
iab zhdate <c-r>=strftime("%F %a %T")<cr>
iab endate <c-r>=strftime("%a %b %d %Y %T")<cr>
" }}}

" Plugins' Configuration
" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
" }}}
" c.vim {{{
let g:C_Ctrl_j = 'off'
" }}}
" OmniCppComplete {{{
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

let OmniCpp_GlobalScopeSearch = 1 "default
let OmniCpp_NamespaceSearch = 2
let OmniCpp_DisplayMode = 0 "default
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1 "default
let OmniCpp_MayCompleteDot = 1 "default
let OmniCpp_MayCompleteArrow = 1 "default
let OmniCpp_MayCompleteScope = 1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_LocalSearchDecl = 1

"Setup the tab key to do autocompletion
function! CompleteTab()
  let prec = strpart( getline('.'), 0, col('.')-1 )
  if prec =~ '^\s*$' || prec =~ '\s$'
    return "\<tab>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
"inoremap <tab> <c-r>=CompleteTab()<cr>
" }}}
" TagList {{{
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 0
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Process_File_Always = 0
let Tlist_Inc_Winwidth = 0
" }}}
" Vary.vim {{{
let g:auto_striptrail = "python,c,cpp,java,php,html"
"let g:auto_striptab = "python,ruby,cpp"
" }}}
" ultisnips {{{
"let g:UltiSnipsExpandTrigger = "<a-tab>"
"let g:UltiSnipsJumpForwardTrigger = "<a-tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = "vertical"
" }}}
" YCM {{{
nnoremap <leader>ygd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ygi :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ygg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_min_num_of_chars_for_completion = 99
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-x>'
let g:ycm_warning_symbol = ">*"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" }}}
" jedi-vim {{{
let g:jedi#completions_enabled = 0
" }}}
" ag & ctrlsf {{{
let g:agprg="/usr/local/bin/ag --vimgrep"
let g:ag_working_path_mode="r"
let g:ag_highlight=1
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
" }}}
" Copy from c.vim {{{
"-------------------------------------------------------------------------------
" additional mapping : complete a classical C comment: '/*' => '/* | */'
"-------------------------------------------------------------------------------
inoremap  <buffer>  /*       /*<Space><Space>*/<Left><Left><Left>
vnoremap  <buffer>  /*      s/*<Space><Space>*/<Left><Left><Left><Esc>p
"-------------------------------------------------------------------------------
" additional mapping : complete a classical C multi-line comment:
"                      '/*<CR>' =>  /*
"                                    * |
"                                    */
"-------------------------------------------------------------------------------
inoremap  <buffer>  /*<CR>  /*<CR><CR>/<Esc>kA<Space>
"-------------------------------------------------------------------------------
" additional mapping : {<CR> always opens a block
"-------------------------------------------------------------------------------
inoremap  <buffer>  {<CR>    {<CR>}<Esc>O
vnoremap  <buffer>  {<CR>   S{<CR>}<Esc>Pk=iB
" }}}
inoremap <buffer> {{{    {{{<CR>}}}<Esc>O
" vim:ft=vim:ts=4:sw=4:sts=4:et:fen:fdm=marker:fmr={{{,}}}:fdl=2
