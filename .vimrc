set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rizzatti/dash.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'fisadev/vim-isort'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'embear/vim-localvimrc'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'jmcomets/vim-pony'
" Plugin 'hdima/python-syntax'
" Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
call vundle#end()
filetype plugin indent on
syntax on

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif

set backspace=indent,eol,start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number
set clipboard=unnamed
set nofoldenable
set noshowmode
set completeopt-=preview
set colorcolumn=80
set splitbelow
set splitright

" python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1

" vim
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

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

let mapleader=","

nmap <leader>l :set list!<CR>

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" Rope
let g:pymode_rope_goto_definition_cmd='vnew'
let g:pymode_rope_lookup_project=0

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <Leader>n :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|py\~|pyc|pyo)$' }

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
autocmd FileType python set ft=python.django
autocmd FileType html set ft=html.django

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
