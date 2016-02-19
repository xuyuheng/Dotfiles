set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tpope/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/taglist.vim'
Plugin 'sjl/gundo.vim'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
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

let mapleader=" "

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:ctrlp_working_path_mode='c'

nnoremap <F6> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

let Tlist_Use_Right_Window = 1
