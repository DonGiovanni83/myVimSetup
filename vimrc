" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number      " show line numbers                                                      
set cursorline  " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable
set foldlevelstart=10   " open most folds by default
hi Normal guibg=NONE ctermbg=NONE


let g:livepreview_previewer = 'evince'

"Template for .java files:
          
autocmd BufNewFile *.java
 \ exe "normal O/**\n\t\tTitle: " . expand('%:t:r') ".java\n"
 \"Author: Fabio Bertagna\n"
 \"Date created: "strftime("%c")"\n"
 \"Comment: \n\n/"
 \"\n\nimport java.util.*;\n\npublic class " . expand('%:t:r') ."{\n"
 \"/*public static void main(String[] args){}*/"
 \ "\n\tpublic " . expand('%:t:r') "(){}\n}\n\n//" . expand('%:t:r') ".java \<Esc>1G"


"Template for .sh files:

autocmd BufNewFile *.sh
 \ exe "normal O#\n#\t\tTitle: " . expand('%:t:r') ".sh\n#"
 \"Author: Fabio Bertagna\n#"
 \"Date created: "strftime("%c")"\n#"
 \"Comment: \n\n"
 \"\n\n#!/bin/bash\n\n\n\n#//" . expand('%:t:r') ".sh \<Esc>1G"


"Template for latex Documents *.pdf

autocmd BufNewFile *.tex
 \ exe "normal O\\documentclass{//TODO}\n\\usepagkage{}\n\\begin{document}\n\\end{document}"

"Tabs to 4 spaces
"filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set wrapmargin=8 

call plug#begin('~/.vim/plugged')

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    
call plug#end()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"java Compiler
"
" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.

map <F2> :set makeprg=javac\ %<CR>:make<CR>
map <F3> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
map <F4> :set makeprg=javac\ #<CR>:make<CR>
map <F5> :!echo #\|awk -F. '{print $1}'\|xargs java<CR>

map! <F2> <Esc>:set makeprg=javac\ %<CR>:make<CR>
map! <F3> <Esc>:!echo %\|awk -F. '{print $1}'\|xargs java<CR>
map! <F4> <Esc>set makeprg=javac\ #<CR>:make<CR>
map! <F5> <Esc>!echo #\|awk -F. '{print $1}'\|xargs java<CR>
" Tip: load a file into the default buffer, and its driver
" into the alternate buffer, then use F9/F12 to build/run.
" Note: # (alternate filename) isn't set until you :next to it!
" Tip2: You can make then run without hitting ENTER to continue. F9-F12

" With these you can cl/cn/cp (quickfix commands) to browse the errors
" after you compile it with :make

set makeprg=javac\ %
set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#

" If two files are loaded, switch to the alternate file, then back.
" That sets # (the alternate file).
if argc() == 2
  n
  e #
endif

startinsert
