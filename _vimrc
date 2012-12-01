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
filetype plugin indent on     " required!

set splitright
set splitbelow
let g:netrw_localcopycmd="copy"
let g:netrw_chgwin=2
let g:netrw_use_noswf= 1
