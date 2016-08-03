runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"load vim-sensible now, so that I can override what it does
runtime! plugin/sensible.vim

" The 256-color "degraded" setting works with a somewhat standard 256-color
" palette.  The 16-color setting advised by the solarized docs requires a very
" special, non-standard 16-color palette in my terminal that ruins all by
" other non-solarized-aware stuff in the terminal.
let g:solarized_termcolors=256 " uncomment for degraded 256-color palette

let g:solarized_visibility="low" " for :set list

set background=dark
colorscheme solarized

set hlsearch
set ignorecase smartcase

set expandtab

set shiftwidth=0  " only change tabstop when needed
set tabstop=2

autocmd BufNewFile,BufRead Vagrantfile setf ruby

set cursorline
set showtabline=2
set winwidth=79
set colorcolumn=80
set mouse=a

" if !has('nvim')
"   set ttymouse=xterm2  " enable dragging inside tmux
" endif

set number

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set nofoldenable

let mapleader=","

" makes CommandT much faster and as a nice side effect, in git repos
" gitignored files are hidden
let g:CommandTFileScanner="git"
let g:netrw_list_hide='.pyc$'

" this is annoying while editing other people's code.
" I still expect git to fix whitespace problems in my changes.
" I will need some sort of autocommand to disable trimming on other people's
" code.
" let g:pymode_trim_whitespaces = 0

" let's try out syntastic
let g:pymode_lint = 0
let g:pymode_rope = 0

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
set statusline=%<%f\ %y%w%q%m%r\ %k%=[%{&fileencoding}-%{&fileformat}]\ 0x%B\ \ %l,%c%V\ %o\ %O\ %P

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" default rst2pseudoxml gives false positives on :ref: and more
" not its fault, it is probably sphinx syntax
let g:syntastic_rst_checkers = ["sphinx"]

" delete buffer, but keep the split
map <leader>d :bp\|bd #<cr>

autocmd FileType ruby map <leader>b Orequire "pry" ; binding.pry<esc>

au BufNewFile,BufRead *.t set filetype=cram
au BufNewFile,BufRead *.html set filetype=htmldjango
