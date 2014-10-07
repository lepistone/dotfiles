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
autocmd FileType ruby,haml,eruby,yaml,html,xml,javascript,sass,cucumber,java,sh,css set sw=2 sts=2 ts=2
autocmd BufNewFile,BufRead Vagrantfile setf ruby

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

set nofoldenable

let mapleader=","

let g:netrw_list_hide="\.pyc$"

" this is annoying while editing other people's code.
" I still expect git to fix whitespace problems in my changes.
" I will need some sort of autocommand to disable trimming on other people's
" code.
" let g:pymode_trim_whitespaces = 0

" delete buffer, but keep the split
map <leader>d :bp\|bd #<cr>
