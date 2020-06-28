" Plugin Config {{{
set nocompatible " Not Vi mode compatible, must be the first line

call plug#begin()

" General Plugins {{{
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'J-Feng/vary.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Auto-Pairs'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/xmledit'
Plug 'SirVer/ultisnips'
Plug 'ycm-core/YouCompleteMe'
Plug 'marijnh/tern_for_vim'
Plug 'J-Feng/myvimfiles'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
" }}}

" Colors {{{
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
" }}}

" Syntaxes {{{
Plug 'vim-scripts/txt.vim'
" }}}

" Language Special {{{
" C
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/c.vim'
" HTML
Plug 'mattn/emmet-vim'
" Python
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/python_match.vim'
Plug 'vim-scripts/indentpython.vim'
" HTML & JS
Plug 'maksimr/vim-jsbeautify'
" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Go
Plug 'fatih/vim-go'
" Rust
Plug 'rust-lang/rust.vim'
" }}}

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

call plug#end()

" https://github.com/junegunn/vim-plug
" Brief help
" :PlugInstall [name ...] [#threads]
" :PlugUpdate [name ...] [#threads]
" :PlugClean[!] - Remove unlisted plugins (bang version will clean without prompt)
" :PlugUpgrade  - Upgrade vim-plug itself
" :PlugStatus
" :PlugDiff
" :PlugSnapshot[!] [output path] - Generate script for restoring the current snapshot of the plugins
" Options
" branch/tag/commit - Branch/tag/commit of the repo to use
" rtp - Subdirectory that contains Vim plugin
" dir - Custom directory for the plugin
" as  - Use different name for the plugin
" do  - Post-update hook (string or funcref)
" on  - On-demand loading: Commands or <Plug>-mappings
" for - On-demand loading: File types
" frozen - Do not update unless explicitly specified
" }}}

" General Settings {{{

" Enable filetype plugin
filetype plugin indent on
syntax on

" A map leader
let mapleader = ","
let g:mapleader = ","

"--------------------------------------
" get platform
"--------------------------------------
function! MySys()
    if  has("win16") || has("win32")     || has("win64") ||
      \ has("win95") || has("win32unix")
        return "windows"
    elseif has("mac")
        return "mac"
    else
        return "linux"
    endif
endfunction

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
set noerrorbells
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
if !has("gui_running")
    set term=xterm-256color
endif
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
set fencs=ucs-bom,utf-8,cp936,gb2312,gb18030,gbk,big5,euc-jp,euc-kr,shift-jis,latin1
"set langmenu=zh_CN.UTF-8
"set helplang=cn

if MySys() == "linux"
    set guifont=YaHei\ Consolas\ Hybrid\ 12
    "set guifont=Monaco\ 14
elseif MySys() == "mac"
    set guifont=Menlo:h15
elseif MySys() == "windows"
    set enc=utf-8
    " Fix MENU crash
    source $VIMRUNTIME/delmenu.vim
    set langmenu=zh_CN.CP936
    source $VIMRUNTIME/menu.vim
    set helplang=cn
    set guifont=Source\ Code\ Pro:h13
endif

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

"set noimdisable

" Cscope settings
"set cscopetag " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set csto=0
set cscopeverbose " show msg when any other cscope db added

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" Themes
if has("gui_running")
    colorscheme onedark
    let g:airline_theme='onedark'
else
    colorscheme Tomorrow-Night-Eighties
    let g:airline_theme='tomorrow'
endif
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
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
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
map <leader>tl :tabnext<CR>
map <leader>th :tabprevious<CR>

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
noremap <leader><F5> :%s/$//g<CR>
noremap <silent> <F10>  <Esc>:NERDTree<CR>
inoremap <silent> <F10>  <Esc><Esc>:NERDTree<CR>
noremap <silent> <F11>  <Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
noremap <silent> <F12>  <Esc>:Tagbar<CR>
inoremap <silent> <F12>  <Esc><Esc>:Tagbar<CR>
"map <C-F12> :!ctags -R --c-kinds=+p --fields=+iaS --extra=+q -f ./tags ./*<CR>
map <C-F12> :!ctags --languages=c --langmap=c:+.c:+.h -R --c-kinds=+p --fields=+iaS --extra=+q -f ./tags ./*<CR>
map <C-F11> :!ctags --languages=c++ -R --c++-kinds=+p --fields=+iaS --extra=+q -f ./tags ./*<CR>
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

autocmd FileType text set syntax=txt
autocmd bufNewFile,BufRead set tags+=./tags
" For input method auto switch
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}}

" Abbreviations {{{
iab zhdate <c-r>=strftime("%F %T")<cr>
iab endate <c-r>=strftime("%a %b %d %Y %T")<cr>
" }}}

let python_highlight_all=1

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

" a.vim {{{
let g:alternateExtensions_cxx = "hxx,hpp,h"
let g:alternateExtensions_hxx = "cxx,cpp,cc"
" }}}

" c.vim {{{
let g:C_Ctrl_j = 'off'
let g:C_FormatDate = '%Y-%m-%d'
let g:C_FormatTime = '%H:%M'
let g:C_FormatYear = '%Y'
"let g:C_GlobalTemplateFile = $HOME.'/.vim/bundle/c.vim/c-support/templates/Templates'
"let g:C_LocalTemplateFile = $HOME.'/.vim/c-support/templates/Templates'
"let g:C_Styles = {'*.c,*.h' : 'default', '*.cc,*.cpp,*.hh,*.hpp' : 'CPP'}
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
let g:auto_striptrail = "python,c,cpp,java,php,html,rust"
"let g:auto_striptab = "python,ruby,cpp"
" }}}
" ultisnips {{{
"let g:UltiSnipsExpandTrigger = "<a-tab>"
"let g:UltiSnipsJumpForwardTrigger = "<a-tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
"let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/myvimfiles/UltiSnips"
vmap <S-s> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
" }}}
" YCM {{{
set completeopt=menu,menuone
nnoremap <leader>ygd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ygi :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ygg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_key_invoke_completion = '<C-x>'
let g:ycm_warning_symbol = ">*"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" }}}
" ag {{{
let g:ag_prg="/usr/local/bin/ag --vimgrep"
let g:ag_working_path_mode="r"
let g:ag_highlight=1
" }}}
" ctrlsf {{{
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
" }}}
" NERDTree {{{
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeIgnore=['\.o$[[file]]', '\.lo[[file]]']
let NERDTreeAutoCenter=1
" }}}
" xmledit {{{
let g:xml_syntax_folding=1
" }}}
" vim-indent-guides {{{
let g:indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" }}}
" vim-jsbeautify {{{
"map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
" }}}
" LanguageClient-neovim {{{
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
let g:LanguageClient_rootMarkers = {
    \ 'rust': ['Cargo.toml'],
    \}

    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" rust.vim {{{
let g:ftplugin_rust_source_path = $HOME.'/mywork/rust'
" }}}

" syntastic {{{
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["rust", "python"] }
" }}}
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
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
" User defined commands
"command! GenTags :!ctags -R --c-kinds=+p --fields=+iaS --extra=+q -f $PWD/tags `find $PWD | egrep ".*\.(cpp|h)$"`<CR>
command! GenTags :!ctags --languages=c,c++ --langmap=c:+.h -R --c-kinds=+p --fields=+iaS --extra=+q -f ./tags ./*
command! StripTrailing :%s/\s\+$//g
" vim:ft=vim:ts=4:sw=4:sts=4:et:fen:fdm=marker:fmr={{{,}}}:fdl=2
