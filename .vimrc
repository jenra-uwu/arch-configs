set tabstop=4
set shiftwidth=4
set number
syntax on
set mouse=a
filetype on


au BufRead,BufNewFile *.tex set filetype=tex
au BufNewFile *.tex 0r ~/.vimtemplates/latex.tex
autocmd FileType tex inoremap ;; <Esc>/%%%%<Enter>"_c4l
autocmd FileType tex inoremap ;b \begin{}<Esc>i
autocmd FileType tex inoremap ;e <Esc>yypl"_cwend<Esc>A%%%%<Esc>0i<Esc>kp^d$A<Tab>
autocmd FileType tex map C :w<CR>:! if pdflatex (echo %); pkill -f (echo -n 'zathura ' && echo (echo % \| sed 's/tex$/pdf/')); zathura (echo % \| sed 's/tex$/pdf/') & disown; end<CR><CR>
autocmd FileType tex inoremap $ $$<Esc>i
autocmd FileType tex inoremap { {}<Esc>i
autocmd FileType tex inoremap [ []<Esc>i
