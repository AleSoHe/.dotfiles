" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when reopening a 
" file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin on
filetype plugin indent on

" Useful options 
set ignorecase
set smartcase		" /x matches x and X, but /X matches only X
set hlsearch        " Highlight the searches. Use :noh to unhilight
set autowrite		" Automatically save before commands like :next and :make
"set incsearch		" Incremental search
"set hidden		    " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" GENERAL configs
" Tab options: tab=4spaces
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Show line number and relative numbers from the actual position
set number
set relativenumber

" Uncomment if visual movement is needed, instead of line movement
"noremap k gk
"noremap j gj

" Default colorscheme
set background=dark
colorscheme gruvbox
set t_Co=256
highlight ColorColumn ctermbg=gray

" Default column to show when exceeding 80 characters
set colorcolumn=81

" To remember last position when reopening a file
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

" Escape when jj or kk
imap jj <ESC>
imap kk <ESC>

set encoding=utf-8

" FILETYPE SPECIFIC 
" though there are ftplugin files for each type

" Treat tikz equal as tex
au BufNewFile,BufRead *.tikz set filetype=tex

" Disable wraping
set nowrap
