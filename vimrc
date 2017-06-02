set nocompatible              " be iMproved
filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Custom settings
let mapleader="_"

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set hlsearch                      " activate search result highlighting
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Ignore files for ctrlp
set wildignore+=tags,doc,tmp,log
set number
set nocompatible      " Do not be compatible with Vi - be iMproved
set laststatus=2      " Always show status bar

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8

set mouse+=a
" tmux knows the extended mouse mode
set ttymouse=xterm2
" no freakin' end of line
set noeol

let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" let g:syntastic_ruby_mri_exec = '/Users/olivernoack/.rbenv/shims/ruby'
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" end

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'flazz/vim-colorschemes'
"Plugin 'jpo/vim-railscasts-theme'
Plugin 'thoughtbot/vim-rspec'
Plugin 'rizzatti/dash.vim'
Plugin 'keith/parsec.vim'
Plugin 'junegunn/fzf'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
"Plugin 'wincent/command-t.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'DepthDeluxe/Todo.vim'
Plugin 'vim-ruby/vim-ruby'

" Optional:
Plugin 'honza/vim-snippets'
" Git repos on your local machine (i.e. when working on your own plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
" Custom settings 2
set linespace=2
set encoding=utf-8
set background=light
colorscheme solarized

if has("gui_macvim") && has("gui_running")
  set guifont=BitstreamVeraSansMono-Roman:h13
  set transparency=8
  if has("statusline") && !&cp
    set laststatus=2  " always show the status bar

    " Start the status line
    set statusline=%f\ %m\ %r
    set statusline+=Line:%l/%L[%p%%]
    set statusline+=\ 
    set statusline+=Col:%v
    set statusline+=\ 
    set statusline+=Buf:#%n
    set statusline+=\ 
    set statusline+=[%b][0x%B]
  endif

  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>

  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif

  "augroup vimrc_autocmds
    "autocmd BufEnter * highlight ColorColumn ctermbg=lightgrey ctermfg=red guibg=#333333
    "autocmd BufEnter * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    "autocmd BufEnter * match OverLength /\%81v.*/
  "augroup END

else
  " #colorscheme parsec
  set guifont=Inconsolata\ for\ Powerline:h14
  " powerline
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
  let g:Powerline_symbols = 'fancy'
  set fillchars+=stl:\ ,stlnc:\

  map <C-t> :CtrlP<CR>
  imap <C-t> <ESC>:CtrlP<CR>
endif

highlight ColorColumn ctermbg=gray
set colorcolumn=80

"set listchars=nbsp:¬,extends:»,precedes:«,trail:•
set listchars=extends:»,precedes:«,trail:•

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"
"let NERDTreeQuitOnOpen = 1

" disable arrow keys
" noremap  <Up> ""
" noremap! <Up> <Esc>
" noremap  <Down> ""
" noremap! <Down> <Esc>
" noremap  <Left> ""
" noremap! <Left> <Esc>
" noremap  <Right> ""
" noremap! <Right> <Esc>

"autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType ruby let &colorcolumn=80
" check if file has been changed
autocmd WinEnter * checktime
autocmd CursorHold * checktime

map <D-F> :Ack<space>
map ,p obinding.pry<ESC>:w<CR>

" copy paste
vnoremap Y "*y
nnoremap Y "*y

"  scroll left and right when 'nowrap':
map <C-L> zl
map <C-H> zh

syntax on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

function! QuickFixOpenAll()
  if empty(getqflist())
    return
  endif
  let s:prev_val = ""
  for d in getqflist()
    let s:curr_val = bufname(d.bufnr)
    if (s:curr_val != s:prev_val)
      exec "edit " . s:curr_val
    endif
    let s:prev_val = s:curr_val
  endfor
endfunction

command! QuickFixOpenAll         call QuickFixOpenAll()


" Gitgutter Icons
let g:gitgutter_sign_added = '✭'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '◄'
let g:gitgutter_sign_removed_first_line = '◄'
let g:gitgutter_sign_modified_removed = '▼'

hi Normal ctermbg=NONE

filetype off
set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim/
filetype on


" mappers
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Normal Mode: Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Visual Mode: Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

function! StartUp()
  if argc() == 1 && isdirectory(argv(0))
    " replace the directory browser with an empty buffer
    enew
    " and open a regular nerdtree instead
    if argv(0) == '.'
      execute 'NERDTree' getcwd()
    else
      execute 'NERDTree' getcwd() . '/' . argv(0)
    endif
  end
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUp()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
