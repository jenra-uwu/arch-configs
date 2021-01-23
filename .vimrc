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
nnoremap C "_C
vnoremap x "_x
vnoremap c "_c
set background=dark
colorscheme solarized8

" Copying in visual mode
vnoremap <C-c> y

" Opening brackets
inoremap { {}<Esc>i
inoremap \{ \{\}<Esc>hi
inoremap [ []<Esc>i
inoremap \[ \[\]<Esc>hi
inoremap ( ()<Esc>i
inoremap \( \(\)<Esc>hi

function CloseBracket(closing)
	let @q = a:closing
	if col(".") < col("$") && getline(".")[col(".")] == a:closing
	else
		let @Q = a:closing
	end
endfunction

" Closing brackets
inoremap } <Esc>:call CloseBracket("}")<CR>"qp"_xa
inoremap ] <Esc>:call CloseBracket("]")<CR>"qp"_xa
inoremap ) <Esc>:call CloseBracket(")")<CR>"qp"_xa

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

