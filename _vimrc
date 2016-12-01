let s:is_windows = has('win95') || has('win16') || has('win32') || has('win64')
let s:is_mac = has('mac')
let s:is_unix = has('unix')

" prevent autocmd duplication
augroup vimrc
    autocmd!
augroup END

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
"let g:no_vimrc_example = 1 " Prevent including vimrc_example (see kaoriya's VIM  default)
"set verbose=20
"set nohidden " Override Japanese UTF-8 vim default set number
set nobackup
set hlsearch
set showcmd
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
set tags+=tags;

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
"" snippets
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'snipmate-snippets'
"Bundle 'garbas/vim-snipmate'
"
""Bundle 'molokai'
"Bundle 'wombat256.vim'
"
""" pseudo clipboard register for non-GUI version of Vim
""Bundle 'kana/vim-fakeclip'
"
"


" # UI
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'bling/vim-airline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'majutsushi/tagbar'
"let g:tagbar_ctags_bin = 'exuberant_ctags'
"NeoBundle 'vim-php/tagbar-phpctags.vim'

" # Input
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
" ## ultisnips
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
"let s:bundle = neobundle#get("ultisnips")
"function! s:bundle.hooks.on_source(bundle)
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    "let g:UltiSnipsSnippetsDir="~/.vim/mysnippets"
"endfunction
"unlet s:bundle
" ## surround
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
" ## operator-camelize
"NeoBundle 'kana/vim-operator-user'
"NeoBundle 'tyru/operator-camelize.vim'
" ## case keeping substitution and etc...
NeoBundle 'tpope/vim-abolish'

" NeoBundle 'vim-jp/vital.vim'
" NeoBundle 'vim-scripts/TwitVim'
"NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'Raimondi/delimitMate'
"NeoBundle 'jiangmiao/auto-pairs'

" unite
"NeoBundle 'Shougo/vimproc', {
"	\'build' : {
"	\	'windows' : 'make -f make_mingw32.mak',
"	\	'cygwin' : 'make -f make_cygwin.mak',
"	\	'mac' : 'make -f make_mac.mak',
"	\	'unix' : 'make -f make_unix.mak',
"	\	},
"	\}

" camelcasemotion
NeoBundle 'bkad/CamelCaseMotion'

" qfreplace
NeoBundle 'thinca/vim-qfreplace'

" codic
NeoBundle 'koron/codic-vim'
NeoBundle 'rhysd/unite-codic.vim'

" ## SQLUtilities
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/SQLUtilities'


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
NeoBundleLazy 'vim-scripts/phpfolding.vim', {
			\'autoload': {'filetypes': ['php']}}

" javasctipt
NeoBundleLazy 'pangloss/vim-javascript', {
			\'autoload': {'filetypes': ['javascript']}}
"NeoBundleLazy 'wookiehangover/jshint.vim', {
"			\'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'Shutnik/jshint2.vim', {
			\'autoload': {'filetypes': ['javascript']}}

" html
NeoBundleLazy 'othree/html5.vim', {
			\'autoload': {'filetypes': ['html','smarty','php']}}
NeoBundleLazy 'mattn/emmet-vim', {
			\'autoload': {'filetypes': ['html','smarty','php']}}
NeoBundleLazy 'tmhedberg/matchit', {
			\'autoload': {'filetypes': ['html','smarty','php']}}

" web
NeoBundleLazy 'maksimr/vim-jsbeautify', {
			\'autoload': {'filetypes': ['javascript','html','css']}}

let s:bundle = neobundle#get("vim-phpqa")
function! s:bundle.hooks.on_source(bundle)
    let g:phpqa_messdetector_ruleset = "~/.vim/experiments/phpmd/ruleset.xml"
    " Run messdetector on save (default = 1)
    let g:phpqa_messdetector_autorun = 0
    " Don't run codesniffer on save (default = 1)
    let g:phpqa_codesniffer_autorun = 0
    " Clover code coverage XML file
    let g:phpqa_codecoverage_file = "clover.xml"
    " Show markers for lines that ARE covered by tests (default = 1)
    let g:phpqa_codecoverage_showcovered = 0
    " workaround
    let g:phpqa_codecoverage_regex = 0
endfunction
unlet s:bundle


call neobundle#end()
filetype plugin indent on "required!

"
" NerdTree
"
" see https://raw.github.com/DAddYE/dotfiles/master/.vim/vimrc
" see http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
"
"" stop the standard plugin
let g:netrw_silent = 1
let g:netrw_quiet  = 1
let g:loaded_netrw = 1
"
let NERDTreeQuitOnOpen  = 0   " don't collapse NERDTree when a file is opened
let NERDTreeMinimalUI   = 1
let NERDTreeDirArrows   = 0   " classic
"let NERDTreeChDirMode   = 2   " change CWD whenever root changed
let NERDTreeIgnore      = []
let NERDTreeHijackNetrw = 0   " don't use secondary NERD tree
"autocmd BufEnter * lcd %:p:h  " tab-independent (indeed!)
ca cd NERDTree
nnoremap <leader>o :<C-u>NERDTreeFind<CR>
nnoremap <leader>t :<C-u>NERDTreeToggle<CR>
"
""
"" plugin CtrlP
""
"let g:ctrlp_use_migemo = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
"" Unite
let g:unite_enable_start_insert = 1
"
"
"
"
"
"
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
set colorcolumn=81
"
"let g:unite_force_overwrite_statusline = 0
"##### auto fcitx switching  ###########
" https://wiki.archlinux.org/index.php/Fcitx_%28%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87%29#Vim
if s:is_unix
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
endif

"
" grep
"
set grepprg=grep\ -rnHi\ --exclude=\\*.{orig,log,tpl.php,bk.php}\ --exclude=phpunit.phar\ --exclude=\\*lessc.inc.php
" usage:
"   :Grep find src -name '*.java' | xargs grep -Hn '\<parseInt\>'
"   :Grep find src \( -path 'src/exclude1' -o -path 'src/exclude2' \) -prune -o -name '*.php' -print | xargs grep -rnH  'pattern'
"   TODO: support `|' in pattern
"
command! -nargs=1 Grep call s:Grep(<f-args>)

function! s:Grep(command)
  let orig_grepprg = &l:grepprg
  let &l:grepprg = substitute(a:command, '|', '\\|', 'g')
  grep
  let &l:grepprg = orig_grepprg
endfunction

"
" Key mappings
"
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]u :<C-u>Unite<CR>
nnoremap <silent> [unite]d :<C-u>Unite codic<CR>

map <Space>c <Plug>(operator-camelize)
nmap <Space>C <Plug>(operator-decamelize)

"
" Commands
"

"function! Debug(msg)
"    echo a:msg
"endfunction
"
"function! s:Write()
"    if line('$') > 1000
"        let g:phpqa_messdetector_autorun = 0
"        write
"        let g:phpqa_messdetector_autorun = 1
"    else
"        write
"    endif
"endfunction
"
function! CommandCabbr(abbreviation, expansion)
    execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction


if has("vim_starting")
    command! TTags !ctags -R --fields=+aimS --languages=php
    command! VVsplit execute "vsp|normal 80\<C-W>|"
    "command WWithoutMD call s:write_without_phpmd()
"    command! -nargs=+ CommandCabbr call CommandCabbr(<f-args>)

"    command! -nargs=* Write call s:Write(<f-args>)
"    CommandCabbr w Write

    " Use it on itself to define a simpler abbreviation for itself.
    " CommandCabbr ccab CommandCabbr
    "command! JsonFormat2 :execute '%!python -m json.tool'
    "  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)), sys.stdin.read()))"'
    "  \ | :%s/ \+$//ge
    "  \ | :set ft=javascript
    "  \ | :1

    " JsonFormat alternative; Firstly format, secondary unescape utf8.
    "command! JsonFormat :execute '%!python -m json.tool'
    "  \ | :execute '%!perl -e \'binmode STDOUT,":utf8";while($line = <>){$line =~ s/\\u([0-9a-zA-Z]{4})/chr(hex($1))/eg;print $line;}\''
    " %!python -m json.tool
    " %!perl -e 'binmode STDOUT,":utf8";while($line = <>){$line =~ s/\\u([0-9a-zA-Z]{4})/chr(hex($1))/eg;print $line;}'
endif


" Load settings (.vimprojects) for each location.
" http://vim-users.jp/2009/12/hack112/
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
  autocmd BufReadPre .vimprojects set ft=vim
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.vimprojects', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" multibyte character detection
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" experiments
"runtime experiments/script.vim

" vim:set ft=vim sw=4 ts=4:
