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
set history=1000	" keep 50 lines 
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

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
   
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType groovy setlocal ts=4 sts=4 sw=4 expandtab
   
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

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
set guifont=Menlo:h14
colorscheme desert	

if &diff	
   colorscheme evening
endif

nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR>

nmap <F4> a<C-R>=strftime("%y%m%d@%H:%M")<CR><Esc>
imap <F4> <C-R>=strftime("%y%m%d@%H:%M!%a")<CR>

set cpoptions+=$
set viminfo='1000,f1,<500,:1000,@100,/100,%

" Underline with '='
nnoremap <leader>1 yypVr=
set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase
set scrolloff=3

" set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
nmap <silent> <leader>n :silent :nohlsearch<CR>


nmap <F7> :MRU<CR>
imap <F7> <Esc>:MRU 
:nnoremap <space> za

au BufNewFile,BufRead *.gradle setf groovy

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Specific for diff
set diffopt=filler
set diffopt+=iwhite
" set diffopt+=icase
" set diffopt+=horizontal

" Better command line:

:set statusline=%F%m%r%h%w\ [FMT=%{&ff}]\ [TYPE=%Y]\ [ASC=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%v]\ [%p%%]\ [LEN=%L]\ %{fugitive#statusline()}%=%-14.(%c%V%)
:set laststatus=2
:set cursorline
map <D-Right> <ESC>:bn<CR>
map <D-Left> <ESC>:bp<CR>

" Integration of the Marked app on mac
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" For fugitive, do not keep buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Changes from VIMCASTS
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

" How to clean whitespaces
" :%s/\s\+$//e
:nmap <silent> <leader>d <Plug>DashSearch
:nmap <silent> <leader>D <Plug>DashGlobalSearch

" For JAD - requires jad in the path
au BufReadCmd *.class setfiletype java | %!jad -p <afile>
