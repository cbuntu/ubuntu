set nocompatible
set backspace=indent,eol,start
set number
"set relativenumber
set numberwidth=1
set ruler
set showcmd
set history=1000
set nobackup
set noswapfile
set showmatch
set autoindent
set cindent
set smartindent
set smarttab
set wrap
set t_Co=256
syntax enable
syntax on
colo void
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set nocp
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set shiftwidth=4
set tabstop=4

au FileType html,python,vim,javascript,qml setl shiftwidth=4
au FileType html,python,vim,javascript,qml setl tabstop=4
au FileType java,php,qml setl shiftwidth=4
au FileType java,php,qml setl tabstop=4
au FileType txt, setl shiftwidth=2
au FileType txt, setl tabstop=2

"设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"neocomplcache
let g:neocomplcache_enable_at_startup = 1

"phpcomplete                                          
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"view manpages in vim
source $VIMRUNTIME/ftplugin/man.vim

"nerdcomment mapleader
let mapleader=","
let g:NERDSpaceDelims="1"

"Editing a protected file as 'sudo'
cmap W w !sudo tee % >/dev/null<CR>
