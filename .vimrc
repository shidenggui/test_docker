set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""" theme molokai"""""""""""""""""
Bundle 'tomasr/molokai'

"""""""""""""""""  golang """""""""""""""""
Bundle 'fatih/vim-go'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'


""""""""""""""""Beautify Status bar"""""""""""""""""
Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'


"""""""""""""""Auto completion of quotes""""""""""
Plugin 'jiangmiao/auto-pairs'


"""""""""""""""python syntax highlight""""""""""""""""""
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

"switch between brackets
Plugin 'vim-scripts/matchit.zip'

"remove useless whitespaces
Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"enhance display of brackets
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

""python mode
"Bundle 'klen/python-mode'
"" Override go-to.definition key shortcut to Ctrl-]
"let g:pymode_rope_goto_definition_bind = "<C-]>"

"Tagbar
Bundle 'majutsushi/tagbar'
nmap <leader>tb :TagbarToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""Customized Configurations""""""""""""""""""""""""""""""""""

"""""""""""""""""General Condfiguration""""""""""""""""
set guifont=Consolas:h20
set background=dark
set t_Co=256

set nobackup "No Back Up
set nowritebackup
set noswapfile

set autoindent               " auto indent
set smartindent              " smart indent
set tabstop=4                " tab width
set softtabstop=4
set shiftwidth=4             "
set backspace=2
set expandtab
set textwidth=79

set nu                      " show line number
set showmatch               " show parentheses match result
set nohlsearch                 " highlight seearch
set incsearch                " open instaneous search
set wrap
set completeopt=longest,menu
let loaded_matchparen = 0  "does not highlight matched parens

"set autochdir " switch working directory automatically
"set bsdir=buffer "set the current browsing folder to current working directory
"set autoread  " auto load file when changed
"set ignorecase "neglect cases when search

set spell "spell check

syntax enable                " syntax highlight
syntax on                    " watch filetype
filetype indent on           " auto indent according to file types
filetype plugin on           " load correspondent plugin accordint to file types

"set foldmethod=syntax		" auto folding
"autocmd! BufNewFile,BufRead * setlocal nofoldenable " no auto folding

let g:Imap_UsePlaceHolders = 0 "delete annoyingjj

"avoid annoying 'press enter to continue'
set shortmess=a
set cmdheight=2

"""""""""""""ignore spaces in vimdiff""""""""""""
if &diff
	"diff mode
	set diffopt+=iwhite
endif


""""""""""""colorscheme mokolai"""""""""""""
let g:molokai_original = 1
colorscheme molokai

