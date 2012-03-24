# Setup

- based on Pathogen loader (see http://www.vim.org/scripts/script.php?script_id=2332)

Also see:

* http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
* http://mirnazim.org/writings/vim-plugins-i-use/

Pathogen itself is not in autoload, but in also under bundle. It is loaded by following from .vimrc

	runtime bundle/vim-pathogen/autoload/pathogen.vim
	call pathogen#infect()
	call pathogen#runtime_append_all_bundles()
	call pathogen#helptags()

# My own customizations

* Q => gq
* Colorscheme: desert
* guifont - Consolas:15 (in Linux, use "Monospace\ 12")
* F3 => Time string
* Alt-j / Alt-k: tab left/right (does not seem to work on Mac)
* F7: - show MRU file lists
* Ctrl-right/left => bn / bp
* space => fold

Special status line:
* file
* format
* file type (syntax)
* current char
* current position
* percentage
* length

## Mac specific

* ESC-m => Marked.app (markdown preview)

# Scripts / Modules used

## align

* :help align
* http://www.vim.org/scripts/script.php?script_id=294

## bufexplorer

* :help bufexplorer
* http://www.vim.org/scripts/script.php?script_id=42
* \be, \bs, \bv
* in list: o - open, t - open in tab, d - delete

## color_sampler_pack

* adds menu with color schemes
* http://www.vim.org/scripts/script.php?script_id=625

## loreimpsum

* http://www.vim.org/scripts/script.php?script_id=2289
* :Loremipsum 

## matchit

* :help matchit
* http://www.vim.org/scripts/script.php?script_id=39
* %, g%, [%, ]%, a% (visual)

## mru

* http://www.vim.org/scripts/script.php?script_id=521
* :MRU
* use F7


## nerdtree

* http://www.vim.org/scripts/script.php?script_id=1658
* :help nerdtree 

## peepopen

* See G. Grossenbach 
* OS-X only

## snipMate

?? Do I need this 

## sqlcomplete

* help sql.txt
* interesting, not really used (yet)
* will leave it for now
* http://www.vim.org/scripts/script.php?script_id=1572

## supertab

* :help supertab
* http://www.vim.org/scripts/script.php?script_id=1643
* press TAB in insert mode

## surround

* http://www.vim.org/scripts/script.php?script_id=1697
* :help surround.txt
** <CMD>s<DIRECTION> - ds", cs]), cs"<q> 

## taglist

* required exuberant ctags (not gnu or Unix)
** ctags --version 
[tkuser@cplx-dev-vf eclipse4]$ ctags --version


        Exuberant Ctags 5.6, Copyright (C) 1996-2004 Darren Hiebert
        Compiled: Jan  6 2007, 02:10:54
        Addresses: <dhiebert@users.sourceforge.net>, http://ctags.sourceforge.net
        Optional compiled features: +wildcards, +regex


* sudo yum install ctags 
** sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
* test in vim: 
** :echo system(Tlist_Ctags_Cmd . ' --version') 

How to use it:

* see http://bgmerrell.blogspot.ca/2008/02/first-of-all-let-me-introduce-ctags-and.html

## tlib_vim

Support fucntions for other modules

* See http://vimsomnia.blogspot.ca/2010/11/selecting-items-from-list-with-tlibs.html
* See http://www.vim.org/scripts/script.php?script_id=1863

## tmarks

browse and to manipulate (place & delete) marks. 



        :TMarks 
            Browse all marks. 
        :{range}TMarksPlace 
           Place the next available a-z mark at the specified line. 
        :{range}TMarksDelete 
           Delete all a-z marks in range. 
        :TMarksDeleteAll 
           Delete all a-z marks in the current buffer. 



## vim-fugitive

* See http://www.vim.org/scripts/script.php?script_id=2975
* :help fugitive
* http://vimcasts.org/episodes/archive

View any blob, tree, commit, or tag in the repository with :Gedit (and :Gsplit, :Gvsplit, :Gtabedit, ...). Edit a file in the index and write to it to stage the changes. Use :Gdiff to bring up the staged version of the file side by side with the working tree version and use Vim's diff handling capabilities to stage a subset of the file's changes. 

Bring up the output of git-status with :Gstatus. Press `-` to add/reset a file's changes, or `p` to add/reset --patch that mofo. And guess what :Gcommit does! 

:Gblame brings up an interactive vertical split with git-blame output. Press enter on a line to reblame the file as it stood in that commit, or`o` to open that commit in a split. 

:Gmove does a git-mv on a file and simultaneously renames the buffer. :Gremove does a git-rm on a file and simultaneously deletes the buffer. 

Use :Ggrep to search the work tree (or any arbitrary commit) with git-grep, skipping over that which is not tracked in the repository. :Glog loads all previous revisions of a file into the quickfix list so you can iterate over them and watch the file evolve! 

:Gread is a variant of `git checkout -- filename` that operates on the buffer rather than the filename.  This means you can use `u` to undo it and you never get any warnings about the file changing outside Vim. :Gwrite writes to both the work tree and index versions of a file, making it like git-add when called from a work tree file and like git-checkout when called from the index or a blob in history. 

Add %{fugitive#statusline()} to 'statusline' to get an indicator with the current branch in (surprise!) your statusline. 

Oh, and of course there's :Git for running any arbitrary command. 


Notable:

* vimdiff - 3 windows
* Gwrite
* Gedit branch:file
 


## vim-pathogen

The library for configuration and loading 

See http://www.vim.org/scripts/script.php?script_id=2332


## vim-peepopen

* See https://github.com/topfunky/PeepOpen-EditorSupport/tree/master/vim-peepopen

## vim-unimpaired

* :help unimpaired

The following maps all correspond to normal mode commands.  If a count is
given, it becomes an argument to the command.  A mnemonic for the "a" commands
is "args" and for the "q" commands is "quickfix".


        [a  :previous
        ]a  :next
        [A  :first
        ]A  :last
        [b  :bprevious
        ]b  :bnext
        [B  :bfirst
        ]B  :blast
        [l  :lprevious
        ]l  :lnext
        [L  :lfirst
        ]L  :llast
        [q  :cprevious
        ]q  :cnext
        [Q  :cfirst
        ]Q  :clast
        [t  :tprevious
        ]t  :tnext
        [T  :tfirst
        ]T  :tlast




