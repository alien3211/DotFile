" $HOME/.vimrc -- a configuration file for Vi IMproved


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
"Vundle BEGIN PLUGIN
Plugin ('VundleVim/Vundle.vim')
Plugin ('yegappan/grep')
Plugin ('yegappan/mru')
Plugin ('kien/ctrlp.vim')
Plugin ('gavinbeatty/dragvisuals.vim')
Plugin ('mileszs/ack.vim')
Plugin ('scrooloose/nerdtree')
Plugin ('vim-scripts/OmniCppComplete')
Plugin ('ervandew/supertab')
Plugin ('majutsushi/tagbar')
Plugin ('vim-airline/vim-airline')
Plugin ('vim-airline/vim-airline-themes')
Plugin ('tpope/vim-fugitive')

call vundle#end()            
"Vundle END PLUGIN


" General settings:
set nocompatible                  " Disable Vi-compatible mode
set magic                         " Use classic regular expressions
set wrapscan                      " Search across multiple lines
set ignorecase                    " Search ignore case
set autoread<                     " When changed file outside of Vim
                                  " automatically read it again
set wildignorecase                " ignore case file name and directories
set noswapfile                    " Disable swap file
set backupcopy=no                 " Do not create backup copies
set formatoptions=tcqr            " Adjust automatic formatting
set backspace=indent,eol,start    " Specify the backspace behavior
set history=1000                  " Specify the number of possible undos
set helplang=en                   " Specify the help language
set spelllang=en_us,en,pl         " Specify the spell checking language
set nospell                       " Disable spell checking by default
filetype on                       " Enable file type detection
filetype plugin on                " Enable file type plug-ins
filetype plugin indent on         " required tu Vundle
runtime ftplugin/man.vim          " Enable plugin man
set directory=~/.vim/tmp/swap     " Directory to swap file
helptags ~/.vim/doc               " Directory to help file
set tags+=./tags,~/.vim/tags/cpp_src,./tags,tags,./TAGS,TAGS,~/.vim/commontags,~/.vim/tags/tag,        " ctags all library

" EnvirConment settings:
set ruler                         " Display the ruler
set showcmd                       " Display commands
set showmode                      " Display the current mode
set number                        " Display line numbers
set hlsearch                      " Highlight all matching patterns
set incsearch                     " Highlight matching text while typing
syntax on                         " Highlight the syntax
set mouse=                        " Disable mause
set wildmenu                      " Possible matches are shown just above
                                  " the command line

" Editing settings:
set textwidth=0                   " Do not set the default text width
set wrap                          " Wrap the displayed text
set linebreak                     " Break lines at a word boundary
set expandtab                     " Replace tabulators with spaces
set tabstop=2                     " Set the number of spaces for a tabulator
set shiftwidth=2                  " Set the number of spaces for indentation
set smartindent                   " does the right thing (mostly) in programs
set cindent                       " stricter rules for C programs
set autoindent                    " Automatically insert line breaks
set nojoinspaces                  " Do not insert a second space after
                                  " a sentence when joining lines
set hidden                        " Hide all inactive buffer, instead remove from memomry
set showmatch                     " When a bracket is inserted, briefly jump to the matching one
"set cursorline                    " highlights the current lines
"set scrolloff=5                   " always show 5 line before and after cursor
"set listchars=tab:*-,trail:·      " set char replacing tab and space at the ends of lines
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=white
set cursorline

" colorscheme
set t_Co=256                      " 256 kolorow
set background=dark               " ciemne tlo
"colorscheme herald                " herald

" Python tab -> 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Configure where search libraries
let &path.="src/include,include,/usr/include,src,inc,src/inc,src,"

" position the cursor in the place where it was before closing the file
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") |
   \ exe "normal `\"" | endif

" Useful mapingC
map <F5> :w <CR> :!g++ --std=c++11 %; ./a.out <CR>
map <F7> :set filetype=tracelog <CR>
nmap <silent> <C-H> :call NoHLSearch()<CR> :noh <CR>  " nohlsearching and deleteall matches
map <F6> :checkt <CR>
nnoremap Q 0y$A <C-r>=<C-r>"<CR><Esc> " calculation aritmetic expressions

" Autoload vim coCfiguration file
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Function set encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Maping opening file
let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" pathogen
execute pathogen#infect()

" Configure the NERDTree plug-in:
let g:NERDTreeWinPos = 'left'           " Place the window to the left
let g:NERDTreeWinSize = 40              " Change the window width
let NERDTreeDirArrows = 0               " Old-school bars (|), +, ~
let NERDTreeShowHidden = 1              " Visible hidden file
nmap <silent> <F10> :NERDTreeToggle<CR>
imap <silent> <F10> <ESC>:NERDTreeToggle<CR>
cmap <silent> <F10> <ESC>:NERDTreeToggle<CR>

" Enhance the vertical movement over wrapped text:
noremap k gk
noremap j gj
noremap <Up> g<Up>
noremap <Down> g<Down>
inoremap <Up> <Esc>g<Up>a
inoremap <Down> <Esc>g<Down>a

" Configure the Tagbar plug-in:
let g:tagbar_left = 0                 " Place the window to the right
let g:tagbar_width = 40               " Change the window width
let g:tagbar_ctags_bin='/home/ealatet/bin/ctags' 
nmap <silent> <F12> :TagbarToggle<CR>
imap <silent> <F12> <ESC>:TagbarToggle<CR>
cmap <silent> <F12> <ESC>:TagbarToggle<CR>

" Configure the Airline plug-in:
set laststatus=2
" let g:airline_powerline_fonts=1
set t_Co=256
set guifont=Liberation\ Mono\ for\ Powerline\ 10
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif
" let g:airline_theme="powerlineish"
" let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message = "no .git"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:airline#extensions#tabline#fnamecollapse = 1 " /a/m/model.rb
" let g:airline#extensions#hunks#non_zero_only = 1 " git gutter



" Function hightlight next search
function! HLNext ()
:highlight ColorMatch ctermfg=black ctermbg=green
  let id_match = getmatches()
  let match_if = matchstr(id_match, "1000")
  if !empty(match_if)
    call matchdelete(1000)
  endif
  let target_pat = '\c\%#'.@/
  let red = matchadd('ColorMatch', target_pat, 101, 1000)
  redraw
endfunction

nnoremap <silent> n n:call HLNext()<CR>
nnoremap <silent> N N:call HLNext()<CR>

" Function delete HLNext and all hlsearch
function! NoHLSearch ()
  let id_match = getmatches()
  let match_if = matchstr(id_match, "1000")
  if !empty(match_if)
    call matchdelete(1000)
  endif
endfunction


" Configuration dtagvisuals.vim
let g:DVB_TrimWS = 1
vmap <expr> H   DVB_Drag('left')
vmap <expr> L   DVB_Drag('right')
vmap <expr> J   DVB_Drag('down')
vmap <expr> K   DVB_Drag('up')


" configuration OmniCppComplete
map <F3> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q ~/.vim/tags/<CR>

let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_NamespaceSearch = 2

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

