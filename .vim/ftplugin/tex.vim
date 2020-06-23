colorscheme torte
set bg=dark

set spelllang=es,en_us
set spell

nnoremap ,f i\begin{figure}[+]<ENTER><TAB>\centering<ENTER>\includegraph
nnoremap ,t J080lBi<ENTER><ESC>0

set tw=80

"Colorscheme depends on time
if strftime("%H") < 18
    colorscheme gruvbox
else
    colorscheme gruvbox
endif

