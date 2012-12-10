set nocompatible
filetype off

if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/ 
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/ 
  call vundle#rc()
endif

Bundle 'tsaleh/vim-matchit'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

Bundle 'kien/ctrlp.vim'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

filetype plugin indent on     " required!

set visualbell 
autocmd FileType text setlocal textwidth=0
set nobackup
set splitright
set splitbelow
let g:netrw_localcopycmd="copy"
let g:netrw_chgwin=2
let g:netrw_use_noswf= 1

set helplang=en
