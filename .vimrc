set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/taglist.vim'
Plugin 'sjl/gundo.vim'
Plugin 'klen/python-mode'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'Valloric/YouCompleteMe'
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
autocmd FileType python setlocal completeopt-=preview

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

" Rope
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'pandas']
" let g:pymode_rope_autoimport_import_after_complete = 1

" Jedi
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#show_call_signatures = "2"

" YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:ctrlp_working_path_mode='c'

" Gundo
nnoremap <F6> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

" Taglist
let Tlist_Use_Right_Window = 1
