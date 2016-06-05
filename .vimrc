" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

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
set tags+=./tags                  " ctags all library

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

let mapleader=','

" hightlight
highlight BadWhitespace ctermbg=red guibg=red
highlight CursorLine cterm=NONE ctermbg=234 ctermfg=white
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

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim
" https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags()

" position the cursor in the place where it was before closing the file
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") |
   \ exe "normal `\"" | endif


" Useful maping
map <F7> :set filetype=tracelog <CR>
nmap <silent> <C-H> :call NoHLSearch()<CR> :noh <CR>  " nohlsearching and deleteall matches
map <F6> :checkt <CR>
nnoremap Q 0y$A <C-r>=<C-r>"<CR><Esc> " calculation aritmetic expressions

" Maping opening file
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Enhance the vertical movement over wrapped text:
noremap k gk
noremap j gj
noremap <Up> g<Up>
noremap <Down> g<Down>
inoremap <Up> <Esc>g<Up>a
inoremap <Down> <Esc>g<Down>a


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

" C
au BufRead,BufNewFile *.c,*.h set expandtab
au BufRead,BufNewFile *.c,*.h set tabstop=4
au BufRead,BufNewFile *.c,*.h set shiftwidth=4
au BufRead,BufNewFile *.c,*.h set autoindent
au BufRead,BufNewFile *.c,*.h match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.c,*.h match BadWhitespace /\s\+$/
au         BufNewFile *.c,*.h set fileformat=unix
au BufRead,BufNewFile *.c,*.h let b:comment_leader = '/* '

" Java
au BufRead,BufNewFile *.java set expandtab
au BufRead,BufNewFile *.java set tabstop=4
au BufRead,BufNewFile *.java set shiftwidth=4
au BufRead,BufNewFile *.java set autoindent
au BufRead,BufNewFile *.java match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.java match BadWhitespace /\s\+$/
au         BufNewFile *.java set fileformat=unix
au BufRead,BufNewFile *.java let b:comment_leader = '//'

" Python, PEP-008
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set textwidth=139
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set autoindent
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'

" JS
au BufRead,BufNewFile *.js set expandtab
au BufRead,BufNewFile *.js set tabstop=4
au BufRead,BufNewFile *.js set softtabstop=4
au BufRead,BufNewFile *.js set shiftwidth=4
au BufRead,BufNewFile *.js set autoindent
au BufRead,BufNewFile *.js match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.js match BadWhitespace /\s\+$/
au         BufNewFile *.js set fileformat=unix
au BufRead,BufNewFile *.js let b:comment_leader = '//'

" Makefile
au BufRead,BufNewFile Makefile* set noexpandtab

" XML
au BufRead,BufNewFile *.xml set expandtab
au BufRead,BufNewFile *.xml set tabstop=4
au BufRead,BufNewFile *.xml set softtabstop=4
au BufRead,BufNewFile *.xml set shiftwidth=4
au BufRead,BufNewFile *.xml set autoindent
au BufRead,BufNewFile *.xml match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.xml match BadWhitespace /\s\+$/
au         BufNewFile *.xml set fileformat=unix
au BufRead,BufNewFile *.xml let b:comment_leader = '<!--'

" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=4
au BufRead,BufNewFile *.html set softtabstop=4
au BufRead,BufNewFile *.html set shiftwidth=4
au BufRead,BufNewFile *.html set autoindent
au BufRead,BufNewFile *.html match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.html match BadWhitespace /\s\+$/
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!--'

" ============================================================================
" Python IDE Setup
" ============================================================================


" Auto-complate
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Airline
set laststatus=2
let g:airline_powerline_fonts=1
set t_Co=256
set guifont=Liberation\ Mono\ for\ Powerline\ 10
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif
let g:airline#extensions#branch#empty_message = "no .git"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number


" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*

" Settings for python-mode
let ropevim_enable_shortcuts = 1
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_run = 0
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 1
let g:pymode_syntax = 1
let g:pymode_virtualenv = 1

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

" Configure the NERDTree plug-in:
let g:NERDTreeWinPos = 'left'           " Place the window to the left
let g:NERDTreeWinSize = 40              " Change the window width
let NERDTreeDirArrows = 0               " Old-school bars (|), +, ~
let NERDTreeShowHidden = 1              " Visible hidden file
nmap <leader>t :NERDTree<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <F10> :NERDTreeToggle<CR>
imap <silent> <F10> <ESC>:NERDTreeToggle<CR>
cmap <silent> <F10> <ESC>:NERDTreeToggle<CR>

"Configure ack
nmap <leader>a <Esc>:Ack!

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


" Vim Git Gutter
" cd ~/.vim/bundle
" git clone https://github.com/airblade/vim-gitgutter.git
" run GitGutterEnable
let g:gitgutter_enabled = 0
set updatetime=1500
nmap <leader>gr :GitGutterToggle<CR>
nmap <leader>s :GitGutterPrevHunk<CR>
nmap <leader>d :GitGutterNextHunk<CR>


" Tagbar
" cd ~/.vim/bundle
" git clone git://github.com/majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 0                 " Place the window to the right
let g:tagbar_width = 40               " Change the window width

" Sorted according to their order in the source file
let g:tagbar_sort = 0

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


" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Configuration bufexplorer
nnoremap <silent> <unique> <leader>b :BufExplorer<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <unique> <leader>sy :SyntasticCheck<CR>



" ============================================================================
" JS IDE Setup
" ============================================================================

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


