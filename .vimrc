" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

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
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"filetype plugin on
au BufNewFile,BufRead *.tikz set filetype=tex

" Highlight searches
set hlsearch

" tab to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Set line number
set number

" Set relative number and visual line movement if tex file
set relativenumber
noremap k gk
noremap j gj

" Enable smart indentation when wrapping text, and show ">>"
"set breakindent
"set showbreak=>>


" Change color
set background=dark
colorscheme gruvbox
set t_Co=256
" To set transparecy
"hi Normal guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=gray
set colorcolumn=81

" Python settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    "\ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 


" To remember last position when reopening a file
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable wraping
set nowrap

" General config for every file
imap jj <ESC>
imap kk <ESC>

" Markdown options
au BufNewFile,BufRead *.md imap ,1 # 
au BufNewFile,BufRead *.md nnoremap ,1 i# 
au BufNewFile,BufRead *.md imap ,2 ## 
au BufNewFile,BufRead *.md nnoremap ,2 i## 
 
" LATEX
" figure macro
au BufNewFile,BufRead *.tex
    \ set spelllang=es,en_us |
    \ set spell
" filetype tikz as tex
au BufNewFile,BufRead *.tikz set filetype=tex
au BufNewFile,BufRead *.tex nnoremap ,f i\begin{figure}[+]<ENTER><TAB>\centering<ENTER>\includegraphics[width=\linewidth]{+}<ENTER>\caption[+]{+}<ENTER>\label{+}<ENTER><BS><BS><BS><BS>\end{figure}<ESC>kkkkk/+<ENTER>
au BufNewFile,BufRead *.tex nnoremap ,t J080lBi<ENTER><ESC>0 
if index(['tex'],&ft) == -1
    if strftime("%H") < 18
        colorscheme github
    else
        colorscheme torte
    endif
endif
"autocmd FileType tex nnoremap ,f i\begin{figure}[+]<ENTER><TAB>\centering<ENTER>\includegraphics[width=\linewidth]{+}<ENTER>\caption[+]{+}<ENTER>\label{+}<ENTER><ESC>0i\end{figure}<ESC>kkkkk/+<ENTER>

set encoding=utf-8
