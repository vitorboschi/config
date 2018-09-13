" Vundle setup begin
" Of course
set nocompatible
"
" Required Vundle setup
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'gmarik/vundle'
	Plugin 'Raimondi/delimitMate'
	Plugin 'mrtazz/DoxygenToolkit.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'majutsushi/tagbar'
	Plugin 'fatih/vim-go'
	Plugin 'tpope/vim-fugitive'
	Plugin 'vim-airline/vim-airline'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'a.vim'
	Plugin 'Gummybears'
	Plugin 'toggle_comment'
	Plugin 'octol/vim-cpp-enhanced-highlight'
	Plugin 'rdnetto/YCM-Generator'
	Plugin 'vim-scripts/indentpython.vim'
	Plugin 'nvie/vim-flake8'
	" Track the engine.
	Plugin 'SirVer/ultisnips'

	" Snippets are separated from the engine. Add this if you want them:
	Plugin 'honza/vim-snippets'

	"show diff signs
	Plugin 'airblade/vim-gitgutter'
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle setup end
let mapleader = " "

"UltiSnips
"If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 "dont ask for confirmation to load config files
nmap <c-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
imap <c-]> <Esc>:YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <c-[> :YcmCompleter FixIt<CR>

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

"python specific configuration
au BufNewFile,BufRead *.py
    \ set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set encoding=utf-8 |
    \ let python_highlight_all=1 |
    \ syntax on


nmap <F8> :TagbarToggle<CR> 
nmap <F9> :Dox<CR>
imap <F9> <Esc>:Dox<CR>

" F2 to alternate between implementation and header files
imap <F2> <Esc>:A<CR>
nmap <F2> :A<CR>

"Shift+F2 to split and open implementation and header at once
nmap O2Q :AS<CR>
imap O2Q <Esc>:AS<CR>

set list          " Display unprintable characters f12 - switches
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


map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
