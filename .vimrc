set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'embear/vim-localvimrc'
Plugin 'fisadev/vim-isort'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'honza/vim-snippets'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jmcomets/vim-pony'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'rhysd/vim-clang-format'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
call vundle#end()
filetype plugin indent on
syntax on

if has("vms")
  set nobackup	" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile	" keep an undo file (undo changes after closing)
endif

set backspace=indent,eol,start
set history=50	" keep 50 lines of command line history
set ruler	      " show the cursor position all the time
set showcmd		  " display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set ignorecase
set number
set clipboard=unnamed
set nofoldenable
set noshowmode
" set completeopt-=preview
set colorcolumn=80
set splitbelow
set splitright
set wildignore+=*.a,*.o
set wildignore+=*~,*.tmp,*.swp
set wildignore+=*.ninja
set wildignore+=*.pyc,*.pyo
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png

set guioptions-=T
set guioptions-=L
set guioptions-=r

" vim
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" cpp, c
autocmd FileType cpp,c,objcpp setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cino=(0,N-s 
  \ shiftround autoindent

" python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  \ shiftround autoindent
autocmd FileType python setlocal filetype=python.django

" html, css, htmldjango
autocmd FileType html,css,htmldjango setlocal expandtab shiftwidth=2 tabstop=2
  \ softtabstop=2 shiftround autoindent

" gyp, gypi
au! BufRead,BufNewFile *.gyp,*.gypi setlocal expandtab shiftwidth=2 tabstop=2
  \ softtabstop=2 shiftround autoindent filetype=python

autocmd FileType qf wincmd J

let python_highlight_all=1

if has('mouse')
  set mouse=a
endif

if has('gui_running')
  set background=dark
  set guifont=Monaco:h12
  colorscheme solarized
else
  colorscheme zenburn
endif

inoremap <C-U> <C-G>u<C-U>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F7> :set hls!<CR>

let mapleader=","

nmap <leader>l :set list!<CR>

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" NERDTree
let NERDTreeRespectWildIgnore=1
map <Leader>n :NERDTreeToggle<CR>
map <Leader>j :NERDTreeFind<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" solarized
call togglebg#map('<F6>')

" UltiSnips
let g:UltiSnipsExpandTrigger='<C-J>'
let g:UltiSnipsListSnippets='<C-K>'
let g:UltiSnipsJumpForwardTrigger='<C-J>'
let g:UltiSnipsJumpBackwardTrigger='<C-Z>'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

" YouCompleteMe
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>l :YcmCompleter GoToReferences<CR>
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_filetype_specific_completion_to_disable = {
  \ 'objcpp': 1
  \}

" Sorround
let g:surround_{char2nr("v")}="{{ \r }}"
let g:surround_{char2nr("{")}="{{ \r }}"
let g:surround_{char2nr("%")}="{% \r %}"
let g:surround_{char2nr("b")}="{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let g:surround_{char2nr("i")}="{% if \1condition: \1 %}\r{% endif %}"
let g:surround_{char2nr("w")}="{% with \1with: \1 %}\r{% endwith %}"
let g:surround_{char2nr("f")}="{% for \1for loop: \1 %}\r{% endfor %}"
let g:surround_{char2nr("c")}="{% comment %}\r{% endcomment %}"

" Clang-Format
map <Leader>c :ClangFormat<CR>
let g:clang_format#style_options = {
  \ "AccessModifierOffset" : -4,
  \ "BasedOnStyle": "Chromium",
  \ "IndentCaseLabels": "false",
  \ "IndentWidth": 4,
  \ "ObjCBlockIndentWidth": 4,
  \ "SortIncludes": "true", 
  \}
