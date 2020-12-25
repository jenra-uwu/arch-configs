" Miscellaneous stuff
set tabstop=4
set shiftwidth=4
set number
syntax on
set mouse=a
filetype on
set clipboard=unnamedplus

" Copying in visual mode
vnoremap <C-c> "


" Opening brackets
inoremap { {}<Esc>i
inoremap \{ \{\}<Esc>hi
inoremap [ []<Esc>i
inoremap \[ \[\]<Esc>hi
inoremap ( ()<Esc>i
inoremap \( \(\)<Esc>hi
inoremap " ""<Esc>i

" Closing brackets
inoremap } <Esc>f}a
inoremap ] <Esc>f]a
inoremap ) <Esc>f)a
inoremap <C-l> <Esc>f"a

" Visual mode brackets
vnoremap { <Esc>`>a}<Esc>`<i{<Esc>
vnoremap \{ <Esc>`>a\}<Esc>`<i\{<Esc>
vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap \[ <Esc>`>a\]<Esc>`<i\[<Esc>
vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap \( <Esc>`>a\)<Esc>`<i\(<Esc>

" Newlines that preserve indentation
inoremap <CR> <Esc>0i <Esc>A.<Esc>0"wy/\S<CR>"_x$"_xo<Esc>"wp0"_xA


" LaTeX stuff
" Set file type
au BufRead,BufNewFile *.tex set filetype=tex
" Insert template
au BufNewFile *.tex 0r ~/.vimtemplates/latex.tex
" Jump to next %%%%
autocmd FileType tex inoremap ;; <Esc>/%%%%<Enter>"_c4l
autocmd FileType tex inoremap ;b \begin{}<Esc>i
" Create \end{thingy}
autocmd FileType tex inoremap ;e <Esc>F\"wyf}o<Esc>"wpbbb"_cwend<Esc>A%%%%<Esc>k0i <Esc>"wy/\S<CR>"_xj0"wP0"_xko<Esc>"wp0"_xA<Tab>
" Compile and display LaTeX
autocmd FileType tex map C :w<CR>:! if pdflatex (echo %); pkill -f (echo -n 'zathura ' && echo (echo % \| sed 's/tex$/pdf/')); zathura (echo % \| sed 's/tex$/pdf/') & disown; end<CR><CR>
" Double dollar sign and skip over dollar signs
autocmd FileType tex inoremap $ $$<Esc>i
autocmd FileType tex inoremap <C-l> <Esc>f$a

