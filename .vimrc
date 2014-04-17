runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

set nocompatible

set incsearch
set hlsearch
set history=1000
set ignorecase smartcase
set ruler

set expandtab
set autoindent
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set sw=2 sts=2

set cursorline
set laststatus=2
set showtabline=2
set winwidth=79
set mouse=a
set showcmd

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let mapleader=","
