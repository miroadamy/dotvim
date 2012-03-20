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



