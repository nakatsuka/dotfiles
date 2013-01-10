"
" Sharing .vimrc between Linux and Windows.
" @see http://holypp.hatenablog.com/entry/20110515/1305443997
"
" * For Windows
" install msysgit first and make curl.cmd according to helps:
" 	https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
"
" * Create dotfiles repository as:
"  $ mkdir ~/dotfiles/
"  $ cd ~/dotfiles/
"  $ git init
"  $ git add somefiles
"  $ git commit -m "first commit"
"  $ git mkdir vimfiles
"  $ git submodule add http://github.com/gmarik/vundle.git vimfiles/vundle.git
"  $ git commit -m "add vundle"
"  $ git remote add origin https://github.com/username/dotfiles.git
"	 OR git remote add origin git@github.com:username/dotfiles
"  $ echo '/vimfiles/bundle' >  ~/dotfiles/.gitignore
"  $ git add .gitignore
"  $ git commit -m "add .gitignore"
"  $ git push origin master
"
" * Clone the repository as:
"  $ git clone https://github.com/username/dotfiles.git ~/dotfiles
"  $ cd ~/dotfiles
"  $ git submodule init
"  $ git submodule update
"
" * Create symbolic links in your home which point to files/directory under dotfiles.
" * And for vim, execute :BundleInstall to install plugins.
"

"set verbose=20
let s:is_windows = has('win95') || has('win16') || has('win32') || has('win64')
set nocompatible	" required by some plugins.
set nobackup
set cmdheight=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
set tabstop=4
set shiftwidth=4
set listchars=tab:^\ ,trail:\ 
set list
set tags=tags;/


"
" LANGUAGE configuration
"
if s:is_windows
  language message en
else
  language mes C
endif
set helplang=en,ja 


"
" VUNDLE PLUGIN MANAGER configuration
"
" @see http://holypp.hatenablog.com/entry/20110515/1305443997
"
"set nocompatible	"required!
filetype off		"required!

if s:is_windows
	set rtp+=~/vimfiles/vundle.git/ 
	call vundle#rc('~/vimfiles/bundle/')
else
	set rtp+=~/.vim/vundle.git/ 
	call vundle#rc()
endif

" file explorer
Bundle 'scrooloose/nerdtree'

" fuzzy finder
Bundle 'kien/ctrlp.vim'

" extended matching with "%"
Bundle 'tsaleh/vim-matchit'

" vim-surrond
" (vim-repeat is optional)
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

" colorscheme
Bundle 'altercation/vim-colors-solarized'

" pseudo clipboard register for non-GUI version of Vim 
Bundle 'kana/vim-fakeclip'

Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/SQLUtilities'

filetype plugin indent on	"required!


"
" FILE EXPLORER configuration
"
" @see https://raw.github.com/DAddYE/dotfiles/master/.vim/vimrc
" @see http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
"
" Stop the standard plugin
let g:netrw_silent = 1
let g:netrw_quiet  = 1
let g:loaded_netrw = 1
" NERDTree configuration
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

"" Prevent including vimrc_example, kaoriya's VIM  default
"let g:no_vimrc_example = 1 "
"" override VIMRC_EXAMPLE settings
"autocmd FileType text setlocal textwidth=0

" override Japanese UTF-8 vim default
set nohidden


"
" CTRLP configuration
" 
" @see https://github.com/kien/ctrlp.vim/issues/232
"
let g:ctrlp_use_migemo = 0
function! _CTRLP_OpenWithExternalProgram(action, line)
	if a:action == 'x'
		if s:is_windows
			" Get the filename
			let filename = fnamemodify(a:line, ':p')
			" Close CtrlP
			call ctrlp#exit()
			" Open the file
			silent! execute '! start "" "' . filename . '"'
		elseif has('win32unix')
			let filename = fnameescape(fnamemodify(a:line, ':p'))
			call ctrlp#exit()
			silent! execute '! cmd /c start "" `cygpath -d "' . filename . '"`'
		elseif has('x11') && fnamemodify(a:line, ':e') =~? '^html\?$'
			let filename = fnameescape(fnamemodify(a:line, ':p'))
			call ctrlp#exit()
			silent! execute '!xdg-open' filename
		else
			" Not match, simulate pressing <c-o> again
			call feedkeys("\<c-o>")
		endif
	else
		" Use CtrlP's default file opening function
		call call('ctrlp#acceptfile', [a:action, a:line])
	endif
endfunction
let g:ctrlp_open_func = { 'files': '_CTRLP_OpenWithExternalProgram' }


"
" COLORSCHEME configuration
"
syntax enable
set background=dark
" termtrans=1 works well with windows mintty/gvim transparency
let g:solarized_termtrans=1
let g:solarized_contrast='high'
let g:solarized_visibility='high'
colorscheme solarized
" ctermfg=Black is good on solarized mintty, any better options?
hi SpecialKey ctermfg=Black
"hi NonText ctermbg=Black

" vim:set ft=vim sw=4 ts=4:
