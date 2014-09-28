set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Vundle bundles
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-rails'
Plugin 'tristen/vim-sparkup'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'fatih/vim-go'

call vundle#end()

" .vimrc commands
filetype plugin indent on

" Load specific solarized settings
syntax on
runtime solarized.vimrc

scriptencoding utf-8
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

"Getting rid of arrow keys.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

set list
set listchars=tab:\|\ 

"Parenthesis Completion
inoremap {<CR>  {<CR>}<Esc>O

"Leader functions
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
"Opens a new vsplit and shifts focus
nnoremap <leader>w <C-w>v<C-w>l
"Opens a split and shifts focus
nnoremap <leader>s <C-w>s
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>a :Ack 
nnoremap <leader>g :Git 

"Split options
set splitbelow
set splitright

"Syntastic options
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

"Setting ack.vim to use ag
let g:ackprg = 'ag --nogroup --nocolor --column'

"Run go fmt after save
au FileType go au BufWritePre <buffer> GoFmt

"Easytags setup
"Set Easytags to save to .tags in the local folder
set tags=./tags
"Create the local tag file if not exist
let g:easytags_dynamic_files=2
"Run Easytags async
let g:easytags_async=1
au FileType *.go,*.js,*.py,*.rb BufWritePost UpdateTags

set bs=2
"Indentation for Python
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
"Set smartindent
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
"Prolog file detection, because Razvan
au BufRead,BufNewFile *.pro set filetype=prolog
let g:Powerline_symbols = 'fancy'

function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-k> :call <SID>swap_up()<CR>
noremap <silent> <c-j> :call <SID>swap_down()<CR>

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

let g:sparkupExecuteMapping = '<C-e>'
let g:sparkupNextMapping = '<C-n>'

