let s:is_windows = has('win95') || has('win16') || has('win32') || has('win64')
let s:is_mac = has('mac')
let s:is_unix = has('unix')

augroup vimrc
    autocmd!
augroup END

"let g:no_vimrc_example = 1 " Prevent including vimrc_example (see kaoriya's VIM  default)

"set verbose=20
"set nohidden " Override Japanese UTF-8 vim default
set number
set nobackup
set hlsearch
"set cmdheight=2 " Make command line two lines high
set mousehide " Hide the mouse when typing text
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set matchtime=1
set pumheight=10
set laststatus=2
set display=lastline
"set ambiwidth=double "env VTC_CJK_WIDTH=1 may be needed
"set cursorline " too slow
set listchars=tab:^\ ,trail:\_
set list
"set tags=tags;/

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
"set nocompatible
if &compatible
    set nocompatible
endif
"filetype off "required for Vundle!

if has("vim_starting")
	if s:is_windows
		set rtp+=~/vimfiles/neobundle.vim/
	else
		set rtp+=~/.vim/neobundle.vim/
	endif
endif

if s:is_windows
	call neobundle#rc('~/vimfiles/bundle/')
else
	call neobundle#begin()
endif

" version control integration
"Bundle 'vim-scripts/vcscommand.vim'
"
"" file tree
"Bundle 'scrooloose/nerdtree'
"
"" file finder
"Bundle 'kien/ctrlp.vim'
"
"" extended matching with "%"
"Bundle 'tsaleh/vim-matchit'
"
"" surronding utilities
"" (vim-repeat is optional)
"Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-surround'
"
"" snippets
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'snipmate-snippets'
"Bundle 'garbas/vim-snipmate'
"
""Bundle 'molokai'
""Bundle 'altercation/vim-colors-solarized'
"Bundle 'wombat256.vim'
"
""" pseudo clipboard register for non-GUI version of Vim
""Bundle 'kana/vim-fakeclip'
"
""" SQL utilities
""Bundle 'vim-scripts/Align'
""Bundle 'vim-scripts/SQLUtilities'
"
"Bundle 'mattn/zencoding-vim'
"

" solarized
NeoBundle 'altercation/vim-colors-solarized'
" indentLine
NeoBundle 'Yggdroot/indentLine'
" ctrlp
NeoBundle 'kien/ctrlp.vim'
" unite
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'Shougo/vimproc', {
"	\'build' : {
"	\	'windows' : 'make -f make_mingw32.mak',
"	\	'cygwin' : 'make -f make_cygwin.mak',
"	\	'mac' : 'make -f make_mac.mak',
"	\	'unix' : 'make -f make_unix.mak',
"	\	},
"	\}
" airline
NeoBundle 'bling/vim-airline'

" markdown
NeoBundleLazy 'kannokanno/previm', {
			\'autoload': {'filetypes': ['mkd']}}
NeoBundleLazy 'tyru/open-browser.vim', {
			\'autoload': {'filetypes': ['mkd']}}
NeoBundleLazy 'godlygeek/tabular', {
			\'autoload': {'filetypes': ['mkd']}}
NeoBundle 'plasticboy/vim-markdown'

" debug
NeoBundle 'joonty/vdebug', 'bg-connection'
" php
NeoBundleLazy 'shawncplus/phpcomplete.vim', {
			\'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'joonty/vim-phpqa', {
			\'autoload': {'filetypes': ['php']}}

call neobundle#end()
filetype plugin indent on "required!

"
" NerdTree
"
" see https://raw.github.com/DAddYE/dotfiles/master/.vim/vimrc
" see http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
"
"" stop the standard plugin
"let g:netrw_silent = 1
"let g:netrw_quiet  = 1
"let g:loaded_netrw = 1
"
"let NERDTreeQuitOnOpen  = 0   " don't collapse NERDTree when a file is opened
"let NERDTreeMinimalUI   = 1
"let NERDTreeDirArrows   = 0   " classic
"let NERDTreeChDirMode   = 2   " change CWD whenever root changed
"let NERDTreeIgnore      = []
"let NERDTreeHijackNetrw = 0   " don't use secondary NERD tree
"autocmd BufEnter * lcd %:p:h  " tab-independent (indeed!)
"ca cd NERDTree
"nnoremap <leader>o :<C-u>NERDTreeFind<CR>
"nnoremap <leader>t :<C-u>NERDTreeToggle<CR>
"
""
"" plugin CtrlP
""
"let g:ctrlp_use_migemo = 0
let g:ctrlp_show_hidden = 1
"
""
"" plugin SnipMate
""
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {} 
"let g:snipMate.scope_aliases.smarty = 'php'

"
" language
"
if s:is_windows
  language message en
else
  language mes C
endif
set helplang=en,ja

"
" syntax highlighting
"
syntax enable
set background=light
"let g:solarized_termcolors=256
colorscheme solarized
"hi SpecialKey ctermbg=232
"hi Visual guibg=grey70
"
"let g:unite_force_overwrite_statusline = 0
"##### auto fcitx  ###########
" https://wiki.archlinux.org/index.php/Fcitx_%28%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87%29#Vim
let g:input_toggle = 1
function! FcitxIMEoff()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! FcitxIMEon()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
autocmd vimrc InsertLeave * call FcitxIMEoff()
autocmd vimrc InsertEnter * call FcitxIMEon()
"##### auto fcitx end ######

runtime experiments/script.vim

" vim:set ft=vim sw=4 ts=4:
