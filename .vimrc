set nocompatible              " be iMproved, required

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" !!!!!!!!!!!!!! REAL ONES !!!!!!!!!!!!!!!!
" PLUGINS FROM GITHUB REPOS
" Nerdtree browser
Plugin 'scrooloose/nerdtree'
" YouCompleteMe code-completer
Plugin 'Valloric/YouCompleteMe'

" Tagbar for file hierarchy view
Plugin 'majutsushi/tagbar'
" Syntastic for syntax checking
Plugin 'scrooloose/syntastic'
" vim-move for vim moving
Plugin 'matze/vim-move'
" vim-airline for looks
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" conque-shell to create ipython split
Plugin 'oplatek/Conque-Shell'
" vim-surround for quick enclosing of selection
Plugin 'tpope/vim-surround'
" ctrlp for navigating through files found by buffers/tags/etc.
Plugin 'kien/ctrlp.vim'
" ultisnips for even faster autocompletion; snippets engine
" integrates with youcompleteme
Plugin 'SirVer/ultisnips'
" actual snippets used by engine
Plugin 'honza/vim-snippets'
" integrade ultisnips with youcompleteme
Plugin 'ervandew/supertab'
" auto-completion for quotes, parens, brackets, etc.
"Plugin 'Raimondi/delimitMate'
"Plugin 'Townk/vim-autoclose'
Plugin 'ervandew/matchem'
"Plugin 'seletskiy/vim-autosurround'
" For more information on search and replace
Plugin 'henrik/vim-indexed-search'
" script for not replacing register when pasting over something
Plugin 'vim-scripts/ReplaceWithRegister'

" Plugins for colorschemes
Plugin 'KeitaNakamura/neodark.vim'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'zsoltf/vim-maui'
"Plugin 'dracula/vim'

" comment script from http://www.vim.org/scripts/script.php?script_id=1528
Plugin 'comments.vim'
 

" !!!!!!!!!!!!!!!! EXAMPLES OF SUPPORTED FORMATS !!!!!!!!!!!!!!!!
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSONAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"       Ricky Chang
"       Credit to: Amir Salihefendic

" Sections:
"    => General
"    => VIM user interface
"    => Colors and Fonts
"    => Files, backups and undo
"    => Text, tab and indent related
"    => Visual mode related
"    => Moving around, tabs, windows and buffers
"    => Status line
"    => Editing mappings
"    => vimgrep searching and cope displaying
"    => Spell checking
"    => Misc
"    => Helper functions
"    => Plugin Settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To fix the Alt+__ key mapping problem
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=100

"set syntax
set smartindent     
set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4    " Indents will have a width of 4.
set expandtab       " Expand TABs to spaces.
set autoindent      " Auto-indentation for new lines
set cindent         " Indenting for C programming language

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Replace deletes with that does not copy
"nnoremap d "_d
"vnoremap d "_d
"vnoremap p "_dP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=6

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
"set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
"set t_vb=
set tm=500

" Make it so that a curly brace/brackets automatically inserts an indented line
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"let g:neodark#terminal_transparent = 1 " default: 0
"let g:neodark#use_256color = 1 " default: 0
"let g:neodark#background='black'

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif


"if has("termguicolors")
   "set termguicolors
"endif

syntax on
"set background=dark
let g:neodark#use_256color = 1 " default: 0
"let g:neodark#background='black' " black, gray or brown
let g:neodark#terminal_transparent = 1 " default: 0

colorscheme neodark

" Set dracula search to be highlighted as well
highlight Search ctermbg=lightyellow ctermfg=black
highlight Visual ctermbg=black ctermfg=lightmagenta
highlight Normal ctermfg=white
highlight Comment ctermfg=darkblue
highlight String ctermfg=DarkRed

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
"set shiftwidth=4
"set tabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=500

"set ai "Auto indent
"set si "Smart indent
set nowrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map 'jump' to edit mode to jj
":map! jj <C-c>
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
"map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
"map <C-N><C-T> :tabnew<cr>
map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
map <leader>tq :tabclose<cr>
"map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Hotkeys for relocating the tabs
nmap gm :tabm +1<Bar>:echo<cr>
nmap g<S-m> :tabm -1<Bar>:echo<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" I have this accomplished by matze/vim-move
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
"vmap <c-s-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <c-s-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Map Alt+C to clear last used search pattern
"nnoremap <M-c> :let @/= "" <CR>
nnoremap <silent> <M-c> :nohlsearch<Bar>:echo<CR>

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" Delete white space on save for Python, R and CoffeeScript
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.pyx :call DeleteTrailingWS()
autocmd BufWrite *.r :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Some remappings to access tags in a newtab
nmap <C-w><C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Map Alt+w to close all
map <A-w> :qa <CR>

" Map Ctrl+z to do something besides suspend
map <C-z> :undo <CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Set delete/yank to copy to clipboard
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Settings for vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" air-line
" get rid of annoying hidden buffer files taking up tab space
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Set vim-airline theme to 'luna'
"let g:airline_theme='wombat'

" Setting fold methods (code collapsing)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" And make comments to become a fold use
"set foldmethod=syntax
":let c_no_comment_fold = 1

" ConqueTerm settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable colors for ConqueTerm sessions
let g:ConqueTerm_Color = 1
" The below 2 are very buggy
" Enable  terminal colors for Conque
"let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
" terminal setting
" let g:ConqueTerm_TERM = 'xterm'

" Things to do default
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default to show line numbers on open
au VimEnter * :set nu
" Default to open NerdTree on open
au VimEnter * NERDTreeToggle
" Default to open Tagbar on open
"au VimEnter * TagbarToggle

" Configurations for YouCompleteMe to work for compatible languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_confirm_extra_conf = 0

" let g:ycm_path_to_python_interpreter="/usr/bin/python"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Disable autocommenting of form // for c++ files
au FileType c,cpp setlocal comments-=:// comments+=f://

" Syntastic 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set syntastic python checker to flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args="--max-line-length=120 --ignore=E702,E701,E401"
let g:syntastic_cpp_checkers = []
let g:syntastic_python_python_exec = '/usr/bin/python'

" Set syntastic python checker to flake8
"let g:syntastic_matlab_checkers = ['mlint']
let g:loaded_syntastic_matlab_mlint_checker = 1

" Hotkeys for all the plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Alt+p to toggle paste mode
set pastetoggle=<A-p>
"map <A-p> :set paste <CR>
" Use F3 to toggle (close and open) NerdTree
nmap <F3> :TagbarToggle<CR>
" Use F2 to toggle (close and open) NerdTree
nmap <F2> :NERDTreeToggle<CR>
" Use F6 to toggle (close and open) NerdTree
nmap <F6> :SyntasticToggleMode<CR>

" map p to ReplaceWithRegister so no copying overwritten text to register
xmap p gr
":map! jj <C-c>
