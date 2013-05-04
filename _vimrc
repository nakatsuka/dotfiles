let s:is_windows = has('win95') || has('win16') || has('win32') || has('win64')
"let g:no_vimrc_example = 1 " Prevent including vimrc_example (see kaoriya's VIM  default)

"set verbose=20
"set nohidden " Override Japanese UTF-8 vim default
set nobackup
set cmdheight=2 " Make command line two lines high
set mousehide " Hide the mouse when typing text
set tabstop=4
set shiftwidth=4
set listchars=tab:^\ ,trail:\ 
set list
set tags=tags;/


"
" Vundle
"
" To share vimrc in Linux and Windows via GitHub, follow steps below:
"   (see http://holypp.hatenablog.com/entry/20110515/1305443997)
"
" * For Windows
"   see https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
"  * Install msysgit
"  * Make git_install_root/cmd/curl.cmd which contains:
"    @rem Do not use "echo off" to not affect any child calls.
"    @setlocal
"    @rem Get the abolute path to the parent directory, which is assumed to be the
"    @rem Git installation root.
"    @for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
"    @set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%
"    @if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
"    @if not exist "%HOME%" @set HOME=%USERPROFILE%
"    @curl.exe %*
"
" * Create dotfiles repository
"  $ mkdir ~/dotfiles/
"  $ cd ~/dotfiles/
"  $ git init
"  $ git add somefiles
"  $ git commit -m "first commit"
"  $ git mkdir vimfiles
"  $ git submodule add http://github.com/gmarik/vundle.git vimfiles/vundle.git
"  $ git commit -m "add vundle"
"  $ git remote add origin https://github.com/username/dotfiles.git
"    OR git remote add origin git@github.com:username/dotfiles
"  $ echo '/vimfiles/bundle' >  ~/dotfiles/.gitignore
"  $ git add .gitignore
"  $ git commit -m "add .gitignore"
"  $ git push origin master
"
" * Clone the repository
"  $ git clone https://github.com/username/dotfiles.git ~/dotfiles
"  $ cd ~/dotfiles
"  $ git submodule init
"  $ git submodule update
"
" * Create symbolic links in your home which point to files/directory under dotfiles.
" * In vim, execute :BundleInstall to install plugins.
"
set nocompatible
filetype off "required!

if s:is_windows
	set rtp+=~/vimfiles/vundle.git/
	call vundle#rc('~/vimfiles/bundle/')
else
	set rtp+=~/.vim/vundle.git/
	call vundle#rc()
endif

" version control integration
Bundle 'vim-scripts/vcscommand.vim'

" file tree
Bundle 'scrooloose/nerdtree'

" file finder
Bundle 'kien/ctrlp.vim'

" extended matching with "%"
Bundle 'tsaleh/vim-matchit'

" surronding utilities
" (vim-repeat is optional)
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'snipmate-snippets'
Bundle 'garbas/vim-snipmate'

"" pseudo clipboard register for non-GUI version of Vim
"Bundle 'kana/vim-fakeclip'

"" SQL utilities
"Bundle 'vim-scripts/Align'
"Bundle 'vim-scripts/SQLUtilities'

filetype plugin indent on "required!

"
" NerdTree
"
" see https://raw.github.com/DAddYE/dotfiles/master/.vim/vimrc
" see http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
"
" stop the standard plugin
let g:netrw_silent = 1
let g:netrw_quiet  = 1
let g:loaded_netrw = 1

let NERDTreeQuitOnOpen  = 0   " don't collapse NERDTree when a file is opened
let NERDTreeMinimalUI   = 1
let NERDTreeDirArrows   = 0   " classic
let NERDTreeChDirMode   = 2   " change CWD whenever root changed
let NERDTreeIgnore      = []
let NERDTreeHijackNetrw = 0   " don't use secondary NERD tree
autocmd BufEnter * lcd %:p:h  " tab-independent (indeed!)
ca cd NERDTree
nnoremap <leader>o :<C-u>NERDTreeFind<CR>
nnoremap <leader>t :<C-u>NERDTreeToggle<CR>

"
" plugin CtrlP
"
let g:ctrlp_use_migemo = 0

"
" plugin SnipMate
"
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases.smarty = 'php'

"
" language
"
if s:is_windows
  language message en
else
  language mes C
endif
set helplang=en,ja

""
"" syntax highlighting
""
"syntax enable

"
" Override VIMRC_EXAMPLE settings
"
autocmd FileType text setlocal textwidth=0



" vim:set ft=vim sw=4 ts=4:
