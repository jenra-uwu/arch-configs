" Miscellaneous stuff
set tabstop=4
set shiftwidth=4
set number
syntax on
set mouse=a
filetype on
set clipboard=unnamedplus
set nocompatible
set autoread
nnoremap x "_x
nnoremap c "_c
highlight Pmenu ctermbg=darkblue guibg=darkblue ctermfg=white guifg=white
highlight PmenuSel ctermbg=blue guibg=blue ctermfg=white guifg=white

" Copying in visual mode
vnoremap <C-c> y

" Opening brackets
inoremap { {}<Esc>i
inoremap \{ \{\}<Esc>hi
inoremap [ []<Esc>i
inoremap \[ \[\]<Esc>hi
inoremap ( ()<Esc>i
inoremap \( \(\)<Esc>hi

" Closing brackets
inoremap } <Esc>:if col(".") < col("$") && getline(".")[col(".")] == "}"<CR>let @q = "}"<CR>else<CR>let @q = "}}"<CR>end<CR>"qpxa
inoremap ] <Esc>:if col(".") < col("$") && getline(".")[col(".")] == "]"<CR>let @q = "]"<CR>else<CR>let @q = "]]"<CR>end<CR>"qpxa
inoremap ) <Esc>:if col(".") < col("$") && getline(".")[col(".")] == ")"<CR>let @q = ")"<CR>else<CR>let @q = "))"<CR>end<CR>"qpxa

" Visual mode brackets
vnoremap { <Esc>`>a}<Esc>`<i{<Esc>
vnoremap \{ <Esc>`>a\}<Esc>`<i\{<Esc>
vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap \[ <Esc>`>a\]<Esc>`<i\[<Esc>
vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap \( <Esc>`>a\)<Esc>`<i\(<Esc>

" Recursive :find
set path+=**
set wildmenu

" Use ^] to jump to tag under cursor
" Use g^] for ambiguous tags
" Use ^t to jump back up the tag stack
command! MakeTags ! ctags -R .
map S :w<CR>:! ctags -R .<CR><CR>

" ^x^f for file names
" ^x^] for tags
" ^n and ^p to go to next and previous suggestion

" Newlines that preserve indentation
" inoremap <CR> <Esc>A.<Esc>F"qd$0i <Esc>A.<Esc>0"wy/\S<CR>"_x$"_xo<Esc>"wp0"_x$"qp"_x^"_xI

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" LaTeX stuff
" Set file type
au BufRead,BufNewFile *.tex set filetype=tex
" Insert template
au BufNewFile *.tex 0r ~/.vim/templates/latex.tex
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

