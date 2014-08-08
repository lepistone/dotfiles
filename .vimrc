runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" interim 256-color solarized because I have trouble setting the solarized
" 16-color palette in the gnome terminal
set t_Co=16
" set t_Co=256
" let g:solarized_termcolors=256
let g:solarized_visibility="low" " used if I enable :set list

syntax enable
set background=dark
colorscheme solarized

filetype plugin indent on

set incsearch
set hlsearch
set history=1000
set ignorecase smartcase
set ruler

set expandtab
set autoindent
autocmd FileType ruby,haml,eruby,yaml,html,xml,javascript,sass,cucumber,java,sh set sw=2 sts=2 ts=2

set cursorline
set scrolloff=3
set laststatus=2
set showtabline=2
set winwidth=79
set colorcolumn=80
set mouse=a
set ttymouse=xterm2  " enable dragging inside tmux
set showcmd

set listchars=eol:¬,extends:»,tab:▸\ ,trail:›  " used if I enable :set list
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let mapleader=","
