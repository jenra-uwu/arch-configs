" Miscellaneous stuff
set updatetime=300
set tabstop=4
set shiftwidth=4
set expandtab
set number
syntax on
set mouse=a
filetype on
set whichwrap+=<,>,h,l,[,]
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
let g:disable_key_mappings = "true"
set updatetime=10
nmap <C-c> <Plug>(coc-codeaction-selected)
vnoremap <C-c> "+y
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Opening brackets
inoremap { {}<Esc>i
inoremap \{ \{\}<Esc>hi
inoremap [ []<Esc>i
inoremap \[ \[\]<Esc>hi
inoremap ( ()<Esc>i
inoremap \( \(\)<Esc>hi

" Use ctrl-[hjkl] to select the active split!
tnoremap <C-e> <Esc><C-\><C-n>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

function CloseBracket(closing)
    if getline(".")[col(".") - 1] == a:closing && getline(".")[col(".")] == a:closing
        :normal "_x
   end
endfunction

" Closing brackets
inoremap } }<Esc>:call CloseBracket("}")<CR>a
inoremap ] ]<Esc>:call CloseBracket("]")<CR>a
inoremap ) )<Esc>:call CloseBracket(")")<CR>a

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
Plug 'OmniSharp/omnisharp-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimlab/split-term.vim'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
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
autocmd FileType tex inoremap ;e <Esc>F\"wyf}o<Esc>"wpbbb"_cwend<Esc>A%%%%<Esc>k0i <Esc>"wy/\S<CR>:noh<CR>"_xj0"wP0"_xko<Esc>"wp0"_xA<Tab>
" Compile and display LaTeX
autocmd FileType tex map C :w<CR>:! if pdflatex (echo %); pkill -f (echo -n 'zathura ' && echo (echo % \| sed 's/tex$/pdf/')); zathura (echo % \| sed 's/tex$/pdf/') & disown; end<CR><CR>
" Double dollar sign and skip over dollar signs
autocmd FileType tex inoremap $ $$<Esc>i
autocmd FileType tex inoremap <C-l> <Esc>f$a

