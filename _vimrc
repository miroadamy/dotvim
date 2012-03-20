" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" The same thing as I have pathogen inside bundle as well
filetype on " make sure git works with VIM. Pathogen will switch it off (I hope)
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file
set history=1000	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Miro's changes
set guifont=Consolas:h15
colorscheme desert	

nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR>

set cpoptions+=$
set viminfo='1000,f1,<500,:1000,@100,/100,%

nnoremap <leader>1 yypVr=
set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase
set scrolloff=3

set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
nmap <silent> <leader>n :silent :nohlsearch<CR>


nmap <F7> :MRU<CR>
imap <F7> <Esc>:MRU 
:nnoremap <space> za
" Shortcuts for moving between tabs. 
" Alt-j to move to the tab to the left 
noremap <A-j> gT 
" Alt-k to move to the tab to the right 
noremap <A-k> gt

au BufNewFile,BufRead *.gradle setf groovy

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Specific for diff
set diffopt=filler
set diffopt+=iwhite
" set diffopt+=icase
" set diffopt+=horizontal

" Better command line:

:set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
:set laststatus=2
:set cursorline
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" Integration of the Marked app on mac
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

