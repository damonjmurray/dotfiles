" ==========================================================
" ==================== GENERAL SETTINGS ====================
" ==========================================================

set nocompatible                           " use Vim settings rather than vi
set backspace=indent,eol,start             " backspace in insert mode
set history=1000                           " cmdline buffer size
set visualbell                             " no sounds
set autoread                               " refresh files when edited elsewhere
set hidden                                 " effective buffer management
set mouse=a                                " enable mouse in all modes
set title                                  " set terminal title

" command-entry timeouts
set timeout
set ttimeout
set ttimeoutlen=500

" no swap files / backups
set noswapfile
set nobackup
set nowb

" remap leader
let mapleader=","

set splitright
set splitbelow


" ==========================================================
" ===================== LOAD PLUG-INS ======================
" ==========================================================

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif




" ==========================================================
" ===================== LOAD MAPPINGS ======================
" ==========================================================

if filereadable(expand("~/.vimrc.mappings"))
  source ~/.vimrc.mappings
endif




" ==========================================================
" =============== EDITOR VISUAL PREFERENCES ================
" ==========================================================

syntax enable                              " syntax highlighting with existing colour settings
set number                                 " show line numbers
set showmatch                              " blip matching brackets
set showmode                               " show current mode
set showcmd                                " show command in statusline
set nowrap                                 " disable line wrap
set display=lastline                       " do not symbol-truncate long lines
set linebreak                              " wrap lines at convenient points

" configure status line
set noruler                                " disable ruler
set laststatus=2                           " let each buffer have its own status bar

" support for personal coding style
set colorcolumn=111                        " we're not on IBM punchcards, but lets keep lengths reasonable

" solarized
set background=dark
colorscheme solarized




" ==========================================================
" ============== TABS, SPACING AND INDENTS  ================
" ==========================================================

filetype indent on                         " enable filetype specific indenting
set autoindent                             " maintain current indent
set smartindent                            " clever code indenting
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab                              " default to spaces for tabs
set list listchars=tab:\ \ ,trail:·        " show tabs and trailing spaces

autocmd BufWritePre * :%s/\s\+$//e         " remove trailing whitespace on save




" ==========================================================
" ====================== COMPLETION ========================
" ==========================================================

set wildmenu
set wildmode=list:longest                  " behave like bash

" ignores (I generally only care about code files, not assets)
set wildignore=*.o,*.obj,*.out,*~,._*,*.swp
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*/.bundle/*,
set wildignore+=*/.sass-cache/*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.git,*.rbc,*.rbo,*.class,.svn
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz




" ==========================================================
" ======================== SEARCH ==========================
" ==========================================================

set hlsearch                               " highlight matches
set incsearch                              " find matches as search term is typed
set ignorecase                             " case-insensitive search
set smartcase                              " only case sensitive if upper-case letters in search term




" ==========================================================
" ======================== SCROLL ==========================
" ==========================================================

set scrolloff=8                            " vertical scroll margin
set sidescrolloff=15                       " side scroll margin
set sidescroll=1                           " sides scroll size




" ==========================================================
" ========================= FOLDS ==========================
" ==========================================================

set nofoldenable                           " do not fold by default
set foldmethod=indent
set foldnestmax=3




" ==========================================================
" ===================== COPY AND PASTE =====================
" ==========================================================

set clipboard=unnamed                      " this makes it possible to 'yank' to the OSX clipboard
