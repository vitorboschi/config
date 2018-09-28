set nocompatible

" Vundle setup begin
" Of course
"
" Required Vundle setup
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'Raimondi/delimitMate'
	Plugin 'mrtazz/DoxygenToolkit.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'majutsushi/tagbar'
	Plugin 'fatih/vim-go'
	Plugin 'tpope/vim-fugitive'
	Plugin 'vim-airline/vim-airline'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'Gummybears'
	Plugin 'toggle_comment'
	Plugin 'octol/vim-cpp-enhanced-highlight'
	Plugin 'rdnetto/YCM-Generator'
	Plugin 'Vimjas/vim-python-pep8-indent'
	Plugin 'nvie/vim-flake8'
	Plugin 'scrooloose/nerdtree'

	" Snippets engine
	Plugin 'SirVer/ultisnips'

	" Snippets for the engine
	Plugin 'honza/vim-snippets'

	" show diff signs
	Plugin 'airblade/vim-gitgutter'

	" fill python docstrings
	Plugin 'heavenshell/vim-pydocstring'

	" support for python virtual environment
	Plugin 'plytophogy/vim-virtualenv'
	
	" toggle keywords with gs. Eg. True -> False
	Plugin 'AndrewRadev/switch.vim'
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle setup end

"use space as leader key'
let mapleader = " "

"UltiSnips
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 "dont ask for confirmation to load config files
let g:ycm_python_binary_path = 'python'
nmap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" misc
"set ai
set cindent
set number
set tabstop=4
"set softtabstop=4
"set expandtab
set shiftwidth=4
set smarttab
set bg=dark
filetype on
set colorcolumn=120

nmap <F8> :TagbarToggle<CR>

"python specific configuration
au FileType python
    \ set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set encoding=utf-8 |
    \ nmap <silent> <F9> <Plug>(pydocstring) |
    \ imap <silent> <F9> <esc><Plug>(pydocstring)<CR> 



au FileType cpp
	\ nmap <F9> :Dox<CR> |
	\ imap <F9> <Esc>:Dox<CR>

set list          " Display unprintable characters
set listchars=tab:\|\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
colorscheme gummybears

set pastetoggle=<F3>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"helpers for opening files in the same directory as the current buffer
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

"Git gutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

"use system clipboard (ctrl+c/ctrl+v)
set clipboard=unnamedplus

"
"set exrc
"set secure

