"
" Configuration for Hanfei Yu
"


"
" Set vim bundle
"
set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Auto tab
Plugin 'vim-scripts/indentpython.vim'

" Auto complete
Plugin 'maralla/completor.vim'

" Check syntax 
Plugin 'vim-syntastic/syntastic'

" Check syntax as type flake8
Plugin 'nvie/vim-flake8'

" Provide Vim a tree directory
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

" Auto format pep8 
Plugin 'tell-k/vim-autopep8'

" Auto pairs tool
Plugin 'jiangmiao/auto-pairs'

" Auto ctrl+p search
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" Lines for indenting
Plugin 'Yggdroot/indentLine'

" Make git command available in Vim
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:completor_python_binary = '/usr/bin/python3'
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

map <C-n> :NERDTreeToggle<CR>


"
" For vim itself
"
set number
set nocompatible
set nowrap
set showmatch
set scrolloff=3
set encoding=utf-8
set fenc=utf-8
set mouse=a 
set hlsearch

" Set syntax highlight
if !exists("g:syntax_on")
    syntax enable
endif

"
" For python
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab 
set autoindent
set fileformat=unix
set foldmethod=indent
set foldlevel=99

"
" Quick Run
"
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()   
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
         exec "!time go run %"
    elseif &filetype == 'mkd'
         exec "!~/.vim/markdown.pl % > %.html &"
         exec "!firefox %.html &"
    endif
endfunc
