set nocompatible " be iMproved, required
filetype off     " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'              " let Vundle manage Vundle, required
"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " A tree explorer plugin for vim
Plugin 'Shougo/unite.vim'               " Navigation between buffers and files
Plugin 'majutsushi/tagbar'              " Class/module browser

"------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes' " lean & mean status/tabline for vim that's light as air
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more
Plugin 'kien/ctrlp.vim'                 " Ctrl+P choose file
Plugin 'tpope/vim-repeat'               " enable repeating supported plugin maps with dot(.)
Plugin 'WolfgangMehner/awk-support'     " This repository hosts the latest development versions of various Vim plug-ins. Currently maintained by Wolfgang Mehner
Plugin 'WolfgangMehner/bash-support'
Plugin 'WolfgangMehner/c-support'
Plugin 'WolfgangMehner/latex-support'
Plugin 'WolfgangMehner/lua-support'
Plugin 'WolfgangMehner/matlab-support'
Plugin 'WolfgangMehner/perl-support'
Plugin 'WolfgangMehner/vim-support'
Plugin 'WolfgangMehner/git-support'
Plugin 'jmcneal/verilog-support'
Plugin 'svermeulen/vim-easyclip'        " EasyClip is a plugin for Vim which contains a collection of clipboard related functionality with the goal of making using the clipboard in Vim simpler and more intuitive without losing any of its power.
Plugin 'elzr/vim-json'                  " Distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
Plugin 'pearofducks/ansible-vim'        " This is a vim syntax plugin for Ansible 2.0, it supports YAML playbooks, Jinja2 templates, and Ansible's hosts files.
Plugin 'chase/vim-ansible-yaml'         " Adds additional syntax highlighting and fixes indentation for Ansible's dialect of YAML.
" Plugin 'MicahElliott/Rocannon'
Plugin 'terryma/vim-multiple-cursors'   " True Sublime Text style multiple selections for Vim
" Plugin 'vim-syntastic/syntastic'        " Syntax checking hacks for vim
Plugin 'ekalinin/Dockerfile.vim'        " Vim syntax file & snippets for Docker's Dockerfile
Plugin 'godlygeek/tabular'              " Vim script for text filtering and alignment
Plugin 'plasticboy/vim-markdown'        " Markdown Vim Mode
" Plugin 'gabrielelana/vim-markdown'    " Markdown for Vim: a complete environment to create Markdown files with a syntax highlight that doesn't suck!
" Plugin 'mzlogin/vim-markdown-toc'     " A vim plugin to generate table of contents for Markdown files.

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'            " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " Dependencies #1
Plugin 'tomtom/tlib_vim'                " Dependencies #2
Plugin 'honza/vim-snippets'             " Snippets repo

"---------------=== Languages support ===-------------
Plugin 'scrooloose/syntastic'           " Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'           " Comment stuff out
Plugin 'mitsuhiko/vim-sparkup'          " Sparkup (XML/jinja/htlm-django/etc.) support

" --- Clojure ---
Plugin 'tpope/vim-fireplace'            " Clojure completion
Plugin 'guns/vim-clojure-highlight'     " Highlighting code
Plugin 'guns/vim-clojure-static'        " Highlighting for static types

" --- Erlang ---
Plugin 'jimenezrick/vimerl'             " The Erlang plugin for Vim

" --- CSS ---
Plugin 'JulesWang/css.vim'              " CSS syntax file
Plugin 'groenewege/vim-less'            " Vim syntax for LESS (dynamic CSS)

" --- JavaScript ---
Plugin 'pangloss/vim-javascript'        " Vastly improved Javascript indentation and syntax support in Vim

" --- HTML ---
Plugin 'othree/html5.vim'               " HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'            " Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation

" --- Python ---
Plugin 'davidhalter/jedi-vim'           " Awesome Python autocompletion with VIM
Plugin 'klen/python-mode'               " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'   " PEP8 indent
Plugin 'jmcantrell/vim-virtualenv'      " Virtualenv support in VIM
Plugin 'janko-m/vim-test'               " A Vim wrapper for running tests on different granularities.
Plugin 'alfredodeza/pytest.vim'         " A simple way of running your tests (with py.test) from within VIM.
Plugin 'heavenshell/vim-pydocstring'    " Generate Python docstring to your Python script file.
" Plugin 'Valloric/YouCompleteMe'         " A code-completion engine for Vim

" --- Rust ---
Plugin 'rust-lang/rust.vim'             " Vim support for Rust file detection and syntax highlighting
Plugin 'racer-rust/vim-racer'           " Rust code completion in vim via racer

call vundle#end() " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================

set backspace=indent,eol,start
" This must happen before the syntax system is enabled
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

" Activate a permanent ruler and add line highlightng as well as numbers.
" Also disable the sucking pydoc preview window for the omni completion
" and highlight current line and disable the blinking cursor.
set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
    set cursorline
endif
set ttyfast

" FONTs
if has('gui_running')
  set lines=50 columns=160 linespace=0
  if has('gui_win32')
    " set guifont=DejaVu_Sans_Mono:h12
    set guifont=Hack:h12
  else
    set guifont=Hack\ 12
  endif
endif

" Enable Syntax Colors
" in GUI mode we go with fruity and Monaco 13
" in CLI mode myterm looks better (fruity is GUI only)
syntax on

tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set hlsearch            " highlighted search results
set nu                  " line numbers
set scrolloff=5         " keep some more lines for scope
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching

" Swaps and backups
if has("win32") || has("win64")
    set dir=$TMP
    set backupdir=$TMP
else
    set dir=/tmp
    set backupdir=/tmp
endif

" Hide some panels
"set guioptions-=m  " remove menu bar
set guioptions-=T   " remove toolbar
"set guioptions-=r  " remove right-hand scroll bar

" Tab Settings
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Highlight characters past column 120
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%120v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" SnipMate settings
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

"NERDTree
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory

" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" TaskList settings
map <F3> :TaskList<CR> " show pending tasks list

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " autofocus on Tagbar open

" ConqueTerm
" nnoremap <F5> :ConqueTermSplit ipython<CR> " run python-scripts at <F5>
" nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR> " and debug-mode for <F6>
" let g:ConqueTerm_StartMessages = 0
" let g:ConqueTerm_CloseOnEnd = 0

" Jedi-vim
let g:jedi#show_call_signatures = 1 " Show call signatures
let g:jedi#popup_on_dot = 1         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
noremap <f7> :w<CR>:SyntasticCheck<CR>

" Better :sign interface symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'

" Vim-Airline
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"=====================================================
" Python-mode settings
"=====================================================
" Python-mode
" Activate rope
" Keys:
" K Show python docs
" <Ctrl-Space> Rope autocomplete
" <Ctrl-c>g Rope goto definition
" <Ctrl-c>d Rope show documentation
" <Ctrl-c>f Rope find occurrences
" <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint', 'pep8']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore="E501,W601,C0110,C0111"
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Get possibility to run Python code
let g:pymode_run = 0

" Other options
let g:pymode_options_colorcolumn = 0
if has("gui_running")
    let g:airline_powerline_fonts = 1
" else
"     let g:airline_powerline_fonts = 0
endif

"=====================================================
" User hotkeys
"=====================================================
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
" noremap <C-z> u
" inoremap <C-z> <C-O>u

" CTRL-Y is Redo
" noremap <C-y> <C-R>
" inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
" nnoremap <C-j> <C-w><C-j>
" nnoremap <C-k> <C-w><C-k>
" nnoremap <C-l> <C-w><C-l>
" nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Generate and insert UUID4 into code by <F12> key
" nnoremap <F12> :call InsertUUID4()<CR>

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

"=====================================================
" Languages support
"=====================================================
" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- Clojure ---
autocmd FileType clj setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" --- Erlang ---
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete

" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
\ --max-line-length=120'

" --- Rust ---
set hidden
let g:racer_cmd = "/Users/savicvalera/racer/target/release/racer"
let $RUST_SRC_PATH = "/Users/savicvalera/rust/src"
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType rust setlocal commentstring=//\ %s

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- template language support (SGML / XML too) ---
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
let g:syntastic_html_checkers = []

"=====================================================
" User functions
"=====================================================
" Small helper that inserts a random uuid4
" ----------------------------------------
function! InsertUUID4()
python << endpython
if 1:
    import uuid, vim
    s = str(uuid.uuid4())
    cpos = vim.current.window.cursor
    cline = vim.current.line
    vim.current.line = cline[:cpos[1] + 1] + s + cline[cpos[1] + 1:]
    vim.current.window.cursor = (cpos[0], cpos[1] + len(s))
endpython
endfunction

" My Function

" From video Vim 04 - Окна
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" http://vim.wikia.com/wiki/A_better_Vimdiff_Git_mergetool
" Disable one diff window during a three-way diff allowing you to cut out the
" noise of a three-way diff and focus on just the changes between two versions
" at a time. Inspired by Steve Losh's Splice
function! DiffToggle(window)
  " Save the cursor position and turn on diff for all windows
  let l:save_cursor = getpos('.')
  windo :diffthis
  " Turn off diff for the specified window (but keep scrollbind) and move
  " the cursor to the left-most diff window
  exe a:window . "wincmd w"
  diffoff
  set scrollbind
  set cursorbind
  exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
  " Update the diff and restore the cursor position
  diffupdate
  call setpos('.', l:save_cursor)
endfunction
" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl :call DiffToggle(1)<cr>
nmap <silent> <leader>dc :call DiffToggle(2)<cr>
nmap <silent> <leader>dr :call DiffToggle(3)<cr>

"=====================================================
" My Personal Settings

colorscheme molokai
set nowrap
set lines=50 columns=160 linespace=0
set cursorline
let g:airline_powerline_fonts = 1

" nnoremap <F5> :echo system('python3 "' . expand('%') . '"')<cr>
" nnoremap <F6> :Commentary<CR>

" From video Vim 04 - Окна
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" Execute current file
nnoremap <F5> :call ExecuteFile()<CR>

" Will attempt to execute the current file based on the `&filetype`
" You need to manually map the filetypes you use most commonly to the
" correct shell command.
function! ExecuteFile()
  let filetype_to_command = {
  \   'javascript': 'node',
  \   'coffee': 'coffee',
  \   'python': 'python3',
  \   'html': 'open',
  \   'sh': 'bash'
  \ }
  let cmd = get(filetype_to_command, &filetype, &filetype)
  call RunShellCommand(cmd." %s")
endfunction

" Enter any shell command and have the output appear in a new buffer
" For example, to word count the current file:
"
"   :Shell wc %s
"
" Thanks to: http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call RunShellCommand(<q-args>)
function! RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
"=====================================================
