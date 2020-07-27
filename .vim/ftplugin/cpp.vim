colorscheme gruvbox
set bg=dark

"---------
" For GDB
"---------
packadd termdebug
" Keymaps
noremap  <leader>td           :Termdebug 
noremap  <leader>a            :Arguments
noremap  <silent>  <leader>b  :Break<cr>
noremap  <silent>  <leader>c  :Continue<cr>
noremap  <silent>  <leader>s  :Step<cr>

