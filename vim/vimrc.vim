set nocompatible
:setlocal keywordprg=:help

"Search into subfolders
set path+=**

"TT support
      au BufNewFile,BufRead *.tt2
           \ if ( getline(1) . getline(2) . getline(3) =~ '<\chtml' |
           \           && getline(1) . getline(2) . getline(3) !~ '<[%?]' ) |
           \   || getline(1) =~ '<!DOCTYPE HTML' |
           \   setf tt2html |
           \ else |
           \   setf tt2 |
           \ endif

"Force UTF-8
set encoding=utf-8
set fileencoding=utf-8

"Disable ARROWS temporarly
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" kjnnoremap <Left> :echo "NO ARROWS!!!!"<CR>
" vnoremap <Left> :<C-u>echo "NO ARROWS!!!!"<CR>
" inoremap <Left> <C-o>:echo "NO ARROWS!!!!"<CR>

"So I can move around in insert
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

if filereadable(expand("~/dotfiles/vim/plug.vim"))
  source ~/dotfiles/vim/plug.vim 
endif

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

set autoread                " detect when a file is changed

"set history=1000            " change history to 1000
"set textwidth=120

set backupdir=~/tmp,/tmp
set directory=~/tmp,/tmp

set laststatus=2




syntax on
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" if &term =~ '256color'
"     " disable background color erase
"     set t_ut=
" endif

" enable 24 bit color support if supported

	 " let g:onedark_termcolors=16
 " let g:onedark_terminal_italics=1
 set background=dark
 let g:dracula_colorterm = 0
 colorscheme dracula

 let g:ragtag_global_maps = 1

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=236
highlight NonText ctermfg=236

" make comments and HTML attributes italic
" highlight Comment cterm=italic
" highlight htmlArg cterm=italic
" highlight xmlAttrib cterm=italic
" highlight Type cterm=italic
" highlight Normal ctermbg=none

set number                  " show line numbers
set relativenumber          " show relative line numbers

" set wrap                    " turn on line wrapping
" set wrapmargin=8            " wrap lines when coming within n characters from side
" set linebreak               " set soft wrapping
" set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set expandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest



" code folding settings
set foldmethod=syntax       " fold based on indent
set foldlevelstart=99
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

" set clipboard=unnamed
set clipboard^=unnamed,unnamedplus

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

"Show insert completion menu
set shortmess-=c

if has('mouse')
	set mouse=a
	" set ttymouse=xterm2
endif

" }}}

" Section Mappings {{{

" set a map leader for more key combos
" let mapleader = ','

" remap esc
" inoremap jk <esc>

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <leader>, :w<cr>

" set paste toggle
set pastetoggle=<leader>v

" toggle paste mode
" map <leader>v :set paste!<cr>

" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" Strip whitespace on save
fun! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfun


nmap <leader>l :set list!<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

map <leader>wc :wincmd q<cr>

" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

map <leader>r :call RunCustomCommand()<cr>
" map <leader>s :call SetCustomCommand()<cr>
let g:silent_custom_command = 0

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!

" }}}

" Section AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J
    autocmd FileType qf nmap q :q<cr>

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    " autocmd! BufEnter * call functions#ApplyLocalSettings(expand('<afile>:p:h'))

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
augroup END

" }}}

" Section Plugins {{{

"" FZF
""""""""""""""""""""""""""""""""""""""
"" Toggle NERDTree
"nmap <silent> <leader>k :NERDTreeToggle<cr>
"" expand to the path of the file in the current buffer
"nmap <silent> <leader>y :NERDTreeFind<cr>

"let NERDTreeShowHidden=1
"let NERDTreeDirArrowExpandable = '▷'
"let NERDTreeDirArrowCollapsible = '▼'

"let g:fzf_layout = { 'down': '~25%' }

"if isdirectory(".git")
"    " if in a git project, use :GFiles
"    nmap <silent> <leader>t :GFiles --cached --others --exclude-standard<cr>
"else
"    " otherwise, use :FZF
"    nmap <silent> <leader>t :FZF<cr>
"endif

"nmap <silent> <leader>r :Buffers<cr>
"nmap <silent> <leader>e :FZF<cr>
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

set complete=.,w,b,u,t

" Enable auto-completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

  "" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)

"nnoremap <silent> <Leader>C :call fzf#run({
"\   'source':
"\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
"\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
"\   'sink':    'colo',
"\   'options': '+m',
"\   'left':    30
"\ })<CR>

"command! FZFMru call fzf#run({
"\  'source':  v:oldfiles,
"\  'sink':    'e',
"\  'options': '-m -x +s',
"\  'down':    '40%'})

"command! -bang -nargs=* Find call fzf#vim#grep(
"	\ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
"	\ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" Emmet
"""""""""""""""""""""""""""""""""""""
let g:user_emmet_settings = {
\  'javascript.jsx': {
\      'extends': 'jsx',
\  },
\}

let g:jsx_ext_required = 0

" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
nmap <leader>* *<c-o>:%s///gn<cr>

let g:ale_python_flake8_options = '--ignore E501,E128,E123,E126'

" let g:le_change_sign_column_color = 1
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'tsserver'],
\	'html': []
\}

" " airline options
let g:airline_powerline_fonts=1


let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_theme='onedark'
 " let g:airline_theme='base16'
 let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 0 " enable airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 1 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#fnamemod = ':t'



 map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

let g:SuperTabCrMapping = 0
" }}}



" Return to the same line you left off at
  augroup line_return
      au!
      au BufReadPost * 
	    \ if line("'\"") > 0 && line("'\"") <= line("$") |
	  \    execute 'normal! g`"zvzz' |
	  \ endif
  augroup END

