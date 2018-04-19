if !has('packages')  " no packaging in vim<8: fallback to pathogen
  runtime pack/main/opt/vim-pathogen/autoload/pathogen.vim
  execute pathogen#infect()
  execute pathogen#interpose('pack/{}/opt/Apprentice')
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if has('termguicolors')  " fancy true colors
  set termguicolors
  let g:gruvbox_italic = 1
  set background=dark
  colorscheme gruvbox
  " Make true color work also in tmux.
  " Those variables are filled automatically only when $TERM=xterm.
  " But in tmux, $TERM=screen so we have to set them manually.
  " See :help xterm-true-color
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  colorscheme apprentice
endif

set hlsearch
set ignorecase
set smartcase

set expandtab

set shiftwidth=0  " 0 means use tabstop
set tabstop=2

set cursorline
set showtabline=2
set winwidth=79
set colorcolumn=80
set mouse=a
set showcmd
set modeline
set fixendofline
set linebreak

if !has('nvim')
  set ttymouse=xterm2  " enable dragging inside tmux
endif

set number
set listchars=tab:▸\ ,eol:¬,trail:⍽

set backup
set backupdir=~/tmp/vim,~/tmp,/var/tmp,/tmp
set directory=~/tmp/vim,~/tmp,/var/tmp,/tmp

set nofoldenable

let mapleader=","

" makes CommandT much faster and as a nice side effect, in git repos
" gitignored files are hidden
let g:CommandTFileScanner="git"
let g:netrw_list_hide='.pyc$'

set statusline=%<%f\ %y%w%q%m%r\ %k%=[%{&fileencoding}-%{&fileformat}]\ 0x%B\ \ %l,%c%V\ %o\ %O\ %P

autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
autocmd BufNewFile,BufRead *.t setfiletype cram

autocmd FileType ruby map <leader>b Orequire "pry" ; binding.pry<esc>

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
