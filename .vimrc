"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
" ------------ Alejandro Solís
                            
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin on
filetype plugin indent on

" Leader key
let mapleader=" "

" Plugins
call plug#begin('~/.vim/plugged')
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'morhetz/gruvbox'
    Plug 'preservim/NERDTree'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'Yggdroot/indentLine'
    Plug 'matze/vim-meson'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf', { 'dir': '/usr/local/src/fzf/' }
    Plug 'junegunn/fzf.vim'
    Plug 'ajh17/VimCompletesMe'
    Plug 'airblade/vim-gitgutter'
    Plug 'mileszs/ack.vim'
    Plug 'brooth/far.vim'
    Plug 'gburca/vim-logcat'
    "Plug 'ycm-core/YouCompleteMe'
    "Plug 'wfxr/minimap.vim'
    "Plug 'LaTeX-Box-Team/LaTeX-Box'
call plug#end()
"
" Clipboard
"vnoremap <leader>y "+y

" CoC
let g:coc_disable_startup_warning = 1

let g:coc_disable_startup_warning = 1
let g:goyo_linenr = 1

" IndentLine
let g:indentLine_char = '▏'

let NERDTreeMapOpenInTab='<ENTER>'


" -----------------------------
" Mappings for plugins features
" -----------------------------
" - NERDTree
map <F2> :NERDTreeToggle<CR>
" - fugitive
map <leader>gh :diffget //3<CR>
map <leader>gu :diffget //2<CR>
map <leader>gs :G<CR>

map <C-p> :Files<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

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
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Show line number and relative numbers from the actual position
set number
"set relativenumber

" Default colorscheme
set background=dark
colorscheme gruvbox
set t_Co=256
"highlight ColorColumn ctermbg=gray

" Default column to show when exceeding 80 characters
set colorcolumn=81

" To remember last position when reopening a file
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

" Escape when jj or kk
imap jj <ESC>
imap kk <ESC>

" To hide or show numbers
noremap <c-n> :set invnumber invrelativenumber <CR>

" For easy vim-windows navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" FZF
nnoremap <c-f> :Files<CR>

" Disable wraping
set nowrap

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" FILETYPE SPECIFIC 
" though there are ftplugin files for each type

" If .bb: load ftplugin/bb.vim
autocmd BufNewFile,BufRead *.bb set ft=bb
autocmd BufNewFile,BufRead *.cbc set ft=cbc
autocmd BufNewFile,BufRead *.bp set ft=bp

" Treat tikz equal as tex
let g:tex_flavor = 'latex'
let g:tex_conceal = ""
au BufNewFile,BufRead *.tikz set filetype=tex

" ctags (checks if there's a tags file, and refreshes it in this case)
au BufWritePost *.py,*.c,*.cpp,*.h,*.cu silent! !eval '[ -f tags ] && ctags -R -o newtags && mv newtags tags' &

" Clipboard yank
set clipboard=unnamedplus
nnoremap y "+y
vnoremap y "+y

" For ctags
"nnoremap <C-]> :tabnew %<CR>g<C-]>
"nnoremap <C-]> :tabnew %g<CR>g<C-]>
vnoremap <C-]> <Esc>:tabnew %<CR>gvg<C-]>

" Avoid clearing the clipboard when closing the editor
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) .
            \ ' | xclip -selection clipboard')
