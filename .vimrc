set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'embear/vim-localvimrc'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'qpkorr/vim-bufkill'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sirver/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-repeat'
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
" Plugin 'fisadev/vim-isort'
Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'glench/vim-jinja2-syntax'

" Web
Plugin 'ap/vim-css-color'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'

" Deprecated
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'honza/vim-snippets'
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
set virtualedit=block
set wildignore+=*.a,*.o
set wildignore+=*~,*.tmp,*.swp
set wildignore+=*.ninja
set wildignore+=*.pyc,*.pyo
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=__pycache__
set wildignore+=*.sqlite3
set wildignore+=tmp,bin
set wildignore+=tags
set wildignore+=node_modules

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

" web
autocmd FileType html,css,sass,scss,javascript,coffee,htmldjango,eruby
  \ setlocal expandtab softtabstop=2 shiftwidth=2 shiftround autoindent

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
map <leader>n :NERDTreeToggle<CR>
map <leader>j :NERDTreeFind<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

" Tagbar
nmap <F8> :TagbarOpen fj<CR>
nmap <F9> :TagbarToggle<CR>

" Gundo
let g:gundo_prefer_python3=1
nnoremap <F5> :GundoToggle<CR>

" solarized
call togglebg#map('<F6>')

" UltiSnips
let g:UltiSnipsExpandTrigger='<C-J>'
let g:UltiSnipsJumpForwardTrigger='<C-J>'
let g:UltiSnipsJumpBackwardTrigger='<C-K>'
let g:UltiSnipsListSnippets='<C-L>'
let g:UltiSnipsEditSplit='horizontal'
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips'

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
let g:syntastic_eruby_ruby_quiet_messages = {
    \ 'regex': 'possibly useless use of a variable in void context',
    \}
let g:syntastic_scss_sass_quiet_messages = {
    \ 'regex': 'File to import not found or unreadable',
    \}

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
  \ 'railslog': 1,
  \}

" Clang-Format
map <leader>c :ClangFormat<CR>
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
let g:ctrlp_extensions = ['quickfix', 'bookmarkdir' ]
let g:ctrlp_custom_ignore = '\v[\/]public/packs'
call ctrlp_bdelete#init()

" Rails
let g:rails_ctags_arguments = ['--field=+l', '--languages=Ruby', '--exclude=.git',  "--exclude='*~'", "--exclude='*.swp'"]

" Commands
command! -nargs=+ -complete=file MCgrep :execute "grep -rn --exclude-dir='**/chromium/out' --exclude=tags --exclude='*~' --exclude='*.swp' <args>"
command! -nargs=+ -complete=file MCgrepadd :execute "grepadd -rn --exclude-dir='**/chromium/out' --exclude=tags --exclude='*~' --exclude='*.swp' <args>"
command! -nargs=+ -complete=file MMgrep :execute "grep -rn --exclude-dir='**/chromium/out' --exclude=tags --exclude='*~' --exclude='*.swp' --exclude-dir='**/chromium' <args>"
command! -nargs=+ -complete=file MMgrepadd :execute "grepadd -rn --exclude-dir='**/chromium/out' --exclude=tags --exclude='*~' --exclude='*.swp' --exclude-dir='**/chromium' <args>"
