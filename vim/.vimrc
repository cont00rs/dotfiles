" behaves nicer when using `fish` in the outer shell
set shell=/bin/bash
let mapleader = "\<Space>"

" Plugins
" -------
if v:version > 800
    packadd matchit
end

" Editor behaviour
" ----------------
" leader twice toggles latest buffers
nnoremap <leader><leader> <c-^>

filetype plugin indent on
syntax on

set encoding=utf-8

" tab settings
set shiftwidth=4
set tabstop=4
set expandtab
set nojoinspaces
set backspace=indent,eol,start

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

set laststatus=2

" persistent undo
set undofile
set undodir=~/.vim/undo
set directory=~/.vim/swap//

" GUI behaviour
" -------------
set mouse=a " mouse interaction
set belloff=all " vim does not beep
set relativenumber
set number " line number in current line for reference
set ruler " right bottom corner line & character count
set autoindent
set formatoptions+=c " automatic formatting of comments, but not text
set formatoptions+=q " enable formatting of comments
set formatoptions+=j " drop comment symbol on joining
set formatoptions+=n " support lists in formatting

set path+=**

set wildmenu
set wildmode=list:full
set wildignore=*.o,*.swp,*.mod

" Color specifications
" --------------------
set background=dark
"colorscheme default
highlight Comment ctermfg=green
highlight Pmenu ctermbg=darkgray
highlight clear Signcolumn
highlight clear SpellBad
highlight clear SpellCap
highlight SpellBad cterm=underline
highlight SpellCap cterm=underline

" show trailing whitespace
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" always present, no buffer movement on new change
if v:version > 800
    set signcolumn=yes
endif

" jump to the last known cursor location when opening a file
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
