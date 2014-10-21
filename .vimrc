set nocompatible

execute pathogen#infect()
filetype plugin indent on
syntax on

" Syntastic settings
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['puppet', 'perl'], 'passive_filetypes': [] }
let g:syntastic_puppet_puppetlint_args = ' --no-class_parameter_defaults-check --no-80chars-check '

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Theme settings
try
	color Tomorrow-Night-Bright
catch
endtry

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" allow switching between buffers without saving
set hidden
let mapleader = ","
set showcmd

" personal settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=76
set smarttab
set expandtab
set smartindent
set ruler
set number
set ttyfast
set autoread
set autowrite
set more
set cursorline!
set nowrap

" visualise tabs, trailing whitespace and funny characters
set list
set listchars=nbsp:¬,tab:»·,trail:·

hi User1 ctermfg=196 guifg=#eea040 guibg=#222222
hi User2 ctermfg=75 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 ctermfg=239 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

" statusline
set statusline=                                     " Override default
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total lines>:<column>
set statusline+=%5*\ %*                             " Set ending space

" set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" no annoying sound on errors
set noerrorbells
set novisualbell
set timeoutlen=500

" highlight search results
set hlsearch

" make search act like search in modern browsers
set incsearch

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching brackets
set matchtime=2

set laststatus=2

" persist undo across sessions
if has("persisten_undo")
	set undodir=~/.vim/undodir
	set undofile
endif

" use :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" reload changes to .vimrc automatically
autocmd BufWritePost ~/.vimrc source ~/.vimrc

" start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
