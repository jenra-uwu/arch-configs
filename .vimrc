set tabstop=4
set shiftwidth=4
set number
syntax on
set mouse=a
filetype on

inoremap ;<Space>; <Esc>/<++><Enter>"_c4l

au BufRead,BufNewFile *.tex set filetype=tex
au BufNewFile *.tex 0r ~/.vimtemplates/latex.tex
autocmd FileType tex inoremap ;b \begin{}<Esc>i
autocmd FileType tex inoremap ;e <Esc>yypl"_cwend<Esc>A<++><Esc>0i<Esc>kp^d$A<Tab>
autocmd FileType tex map C :! pdflatex %<CR><CR>
autocmd FileType tex map V :! pkill -f (echo -n 'zathura ' && echo (echo % \| sed 's/tex$/pdf/')); zathura (echo % \| sed 's/tex$/pdf/') & disown <CR><CR> 
