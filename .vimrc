set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'embear/vim-localvimrc'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'qpkorr/vim-bufkill'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sirver/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'

" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" C-family
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'

" Ruby
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" Python
" Plugin 'glench/vim-jinja2-syntax'
" Plugin 'jmcomets/vim-pony'
Plugin 'fisadev/vim-isort'
Plugin 'hynek/vim-python-pep8-indent'

" Web
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'

" Deprecated
" Plugin 'jiangmiao/auto-pairs'
call vundle#end()
filetype plugin indent on
syntax on

if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file (restore to previous version)
  set undofile  " keep an undo file (undo changes after closing)
endif

set backspace=indent,eol,start
set history=50  " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
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
set wildignore+=__pycache__
set wildignore+=*.sqlite3
set wildignore+=tmp,bin

set guioptions-=T
set guioptions-=L
set guioptions-=r

set fileencodings=ucs-bom,utf-8,cp936,gb2312,default,latin1

" vim
autocmd FileType vim setlocal expandtab softtabstop=2 shiftwidth=2 shiftround
  \ autoindent

" cpp, c
autocmd BufEnter */usr/include/c++/v1/* setlocal filetype=cpp
autocmd FileType cpp,c,objcpp setlocal cino=(0,N-s expandtab softtabstop=4
  \ shiftwidth=4 shiftround autoindent

" python
autocmd FileType python setlocal expandtab softtabstop=4 shiftwidth=4
  \ shiftround autoindent
autocmd FileType python setlocal filetype=python.django

" ruby
autocmd FileType ruby setlocal expandtab softtabstop=2 shiftwidth=2 shiftround
  \ autoindent

" html, css, javascript, htmldjango, eruby
autocmd FileType html,css,javascript,htmldjango,eruby setlocal expandtab
  \ softtabstop=2 shiftwidth=2 shiftround autoindent

" gyp, gypi
au! BufRead,BufNewFile *.gyp,*.gypi setlocal expandtab softtabstop=2
  \ shiftwidth=2 shiftround autoindent filetype=python

" quickfix window position
autocmd FileType qf wincmd J

let python_highlight_all=1

if has('mouse')
  set mouse=a
endif

if has('gui_running')
  set background=dark
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

nmap <leader>L :set list!<CR>
nmap =j :%!python -m json.tool<CR>

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" NERDTree
let NERDTreeRespectWildIgnore=1
map <Leader>n :NERDTreeToggle<CR>
map <Leader>j :NERDTreeFind<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

" Tagbar
nmap <F8> :TagbarOpen fj<CR>
nmap <F9> :TagbarToggle<CR>

" Gundo
let g:gundo_right=1
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
  \ 'gitcommit': 1,
  \ 'objcpp': 1,
  \ 'ruby': 1,
  \}

" Surround
" django
" let g:surround_{char2nr("v")}="{{ \r }}"
" let g:surround_{char2nr("{")}="{{ \r }}"
" let g:surround_{char2nr("%")}="{% \r %}"
" let g:surround_{char2nr("b")}="{% block \1block name: \1 %}\r{% endblock \1\1 %}"
" let g:surround_{char2nr("i")}="{% if \1condition: \1 %}\r{% endif %}"
" let g:surround_{char2nr("w")}="{% with \1with: \1 %}\r{% endwith %}"
" let g:surround_{char2nr("f")}="{% for \1for loop: \1 %}\r{% endfor %}"
" let g:surround_{char2nr("c")}="{% comment %}\r{% endcomment %}"

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

" Ctrlp
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_files=0
