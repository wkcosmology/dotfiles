scriptencoding utf-8

set shell=/bin/bash                            " Set bash as default shell. Fish can not eval backticks
set shortmess+=A                               " Always edit file, even when swap file is found
set diffopt=filler,iwhite                      " In diff mode, ignore whitespace changes and align unchanged lines
set fileencodings=ucs-bom,utf-8,default,latin1 " encoding
set termencoding=utf-8                         " terminal encoding
set nomodeline                                 " turn off modeline for safety
set ruler                                      " position info
set number                                     " show line numbers
set backspace=indent,eol,start                 " Allow backspace in insert mode
set history=1000                               " Store lots of :cmdline history
set showcmd                                    " Show incomplete cmds down the bottom
set showmode                                   " Show current mode down the bottom
set autoread                                   " Reload files changed outside vim
set showmatch                                  " highlight matching bracket
set lazyredraw                                 " redraw only when we need to.
set linebreak                                  " Wrap lines at convenient points
set nobackup                                   " prevent backup
set noswapfile                                 " prevent swapfile
set nowritebackup                              " prevent backup
set display+=lastline                          " show whole lines
set virtualedit=onemore                        " Allow for cursor beyond last character
set scrolljump=5                               " Lines to scroll when cursor leaves screen
set scrolloff=3                                " Minimum lines to keep above and below cursor
syntax on                                      " turn on syntax highlighting
" set backupdir=~/.backup,./.backup,/tmp         " set backup directory
set directory=~/.vim/swap                      " Directory to use for the swap file
set langmenu=en_US                             " set language
let $LANG = 'en_US'
set splitbelow                                 " set panel split position
set splitright
set laststatus=2                               " allways show statusline
":let &winheight = 1
set foldlevelstart=1                           " start folding from specyfic level
set guicursor=                                 " reset cursor shape

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cindent

" turn on plugins and indentation based on filetype
filetype plugin on
filetype indent on

" vim commands autocomplet
set wildmenu
set wildmode=list:longest,full

"no error
set noerrorbells

" search options
set gdefault       " use global as default in regexp
set incsearch      " search during typing
" set hlsearch     " highlight previous search pattern
set ignorecase     " Ignore case in search patterns
set smartcase      " Override ignorecase if the pattern contains upper case characters
set synmaxcol=1000 " max search in columns

" Turn off gui
set guioptions-=T
set guioptions-=L

set inccommand=nosplit

augroup vimrc
  autocmd!
augroup END

" auto remove columns and rows highlighting
autocmd vimrc WinLeave * set nocursorline nocursorcolumn
autocmd vimrc WinEnter * set nocursorline nocursorcolumn

colorscheme shadowmoth

set clipboard+=unnamedplus " integrate system clipboard

let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh']