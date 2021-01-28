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
set autoindent
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C
vnoremap x "_x
vnoremap c "_c
set background=dark
set splitbelow
source ~/.config/nvim/themes/solarized8.vim

" Copying in visual mode
vnoremap <C-c> y

" Opening brackets
inoremap { {}<Esc>i
inoremap \{ \{\}<Esc>hi
inoremap [ []<Esc>i
inoremap \[ \[\]<Esc>hi
inoremap ( ()<Esc>i
inoremap \( \(\)<Esc>hi

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

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

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimlab/split-term.vim'
Plug 'preservim/nerdtree'
call plug#end()


let &t_SI .= "\<Esc>[5 q"
let &t_EI .= "\<Esc>[2 q"


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

