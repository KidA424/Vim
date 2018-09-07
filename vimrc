"                                       --------------------------------
"                                       --------------------------------
"                                       ---  Michael Knopf's _vimrc  ---
"                                       --------------------------------
"                                       --------------------------------


exec "lcd " . expand($HOME)

set nocompatible
filetype off
filetype plugin indent on



" ------------------------------
" ------------------------------
" --------  Appearance  --------
" ------------------------------
" ------------------------------
syntax on

if has('gui_macvim')
    set guifont=Monaco:h12
    set background=dark

    "remove nerdtree scrollbar
    set guioptions-=L
else
    set guifont=Lucida_Console:h10:cDEFAULT
endif

"Make title of tab be title of open file
set title



" ---------------------------
" ---------------------------
" --------  Options  --------
" ---------------------------
" ---------------------------

" Tab settings
"setlocal tabstop=4
"setlocal softtabstop=4
"setlocal shiftwidth=4
"setlocal textwidth=79
setlocal expandtab
setlocal autoindent

"Make arrow keys wrap at ends of lines
set whichwrap+=h,l

"Cause backspace to act normally in insert mode
set backspace=indent,eol,start

"Set line numbering
set number 

"Allow opening new file without saving changes
set hidden

"Search case options
set ignorecase
set smartcase

"Highlight while typing search term
set incsearch
set hlsearch

"Keep current indentation when newline is created
set autoindent

"Screen flashes if error occurs
set vb
set noerrorbells

"Place _viminfo file in home directory
"set viminfo+=n$VIM/_viminfo

"Show partially written commands in bottom right
set showcmd

"Enable mouse
set mouse=a

"Set how full the history can get
set history=1000
set undolevels=1000

"Set tab width
set expandtab

"Get rid of annoying files
set nobackup
set nowritebackup
set noswapfile

"Code folding
set foldmethod=indent
set foldlevel=99

"Don't show full path in tab name
set guitablabel=%t

set omnifunc=syntaxcomplete#Complete

"Change working directory to current file dir on on new buffer
autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif




" -------------------------------
" -------------------------------
" --------  Key mappings --------
" -------------------------------
" -------------------------------

"Set leader
let mapleader = ","

"Select all
nnoremap <c-a> ggVG

"Make delete yank into d register
nnoremap d "_d

"Create space in normal mode
nnoremap <Space> i<Space><Esc>l

"Create newline in normal mode
nnoremap <S-Space> mq0"ay$o<Esc>"ap`qjmqk0"_d$`q

"Copy/paste to/from clipboard
noremap <F5> "*y
noremap <F9> "*p

"Tab with arrow keys
nnoremap <right> a<C-t><Esc>
nnoremap <left>  a<C-d><Esc>
vnoremap <right> >gvl
vnoremap <left> <gvh
vnoremap <Tab> >gvl
vnoremap <S-Tab>  <gvh

"Untab with shift-tab
inoremap <S-Tab> <C-d>

"Stop active search highlighting
nnoremap <CR> :nohlsearch<CR>

"Bind Ctrl+<movement> keys to move around windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"Open new tab
nnoremap <C-n> :tabnew<CR>

"Edit and source _vimrc
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Edit python.vim
nnoremap <leader>epy :tabe $HOME/vimfiles/ftplugin/python/python.vim<cr>

"Edit html.vim
nnoremap <leader>eh :tabe $HOME/vimfiles/ftplugin/html/html.vim<cr>

"Edit javascript.vim
nnoremap <leader>ejs :tabe $HOME/vimfiles/ftplugin/javascript/javascript.vim<cr>

"Edit javascript.vim
nnoremap <leader>epug :tabe $HOME/vimfiles/ftplugin/pug/pug.vim<cr>

"Open explorer window with current file selected
nnoremap <F12> :!start explorer /e, /select, <cWORD><CR>

"Open explorer window with currently open editor file selected
nnoremap <S-F12> :silent !start explorer /e,,%:p:h,/select,%:p<CR>

"Easy Align
xmap ,a <Plug>(EasyAlign)
vmap ,a <Plug>(EasyAlign)
nmap ,a <Plug>(EasyAlign)

"NerdTree
nnoremap <leader>t :NERDTreeToggle<CR>

"Synchronize NERDTree root node with current tab
nnoremap <leader>r :NERDTreeFind<CR>

" Change tabs with page-up, page-down
nnoremap } gt
nnoremap { gT

" move tab left/right
nnoremap <M-]> :execute "tabm" tabpagenr()<CR>
nnoremap <M-[> :execute "tabm" tabpagenr() - 2<CR>
"for mac
nnoremap <D-]> :execute "tabm" tabpagenr() + 1<CR>
nnoremap <D-[> :execute "tabm" tabpagenr() - 2<CR>


" Enclose in single quotes
nnoremap <leader>' mqbi'<ESC>ea'<ESC>`q

" Copy current file absolute path
nnoremap <leader>cp :let @+ = expand("%:p")<CR>

" Move entire line up and down
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv



"""" Control-P file search """"
"Ctrl p for directory search
nnoremap <d-p> :CtrlP<cr>





" ----------------------------------
" ----------------------------------
" --------  Nerd Commenter  --------
" ----------------------------------
" ----------------------------------

" Turn off starting next line with comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign='start'

nnoremap <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction


" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['flow', 'eslint']
\}
"highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
"highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

highlight SpellBad term=undercurl ctermbg=12 gui=undercurl guisp=#ff3300

"vim-flow
let g:flow#enable = 0


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))|node_modules|dev|flow\-typed|flow|static|tests|tmp$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Set ctrl-p working directory to path containing yarn.lock
let g:ctrlp_root_markers = ['yarn.lock']


" -----------------------------
" -----------------------------
" --------  Hostnames  --------
" -----------------------------
" -----------------------------

" source hostname-dependent config file
"let hostname = substitute(system('hostname'), '\n', '', '')

"if hostname == 'KevinKnopf-PC'
"    exec "source " . $HOME . "\\vimfiles\\hostnames\\KevinKnopf-PC.vim"
"elseif hostname == 'dsp-postgres'
"    exec "source " . $HOME . "\\vimfiles\\hostnames\\dsp-postgres.vim"
"elseif hostname == 'cent7-1'
"    exec "source " . $HOME . "/.vim/hostnames/cent7-1.vim"
"elseif hostname == 'michael-VirtualBox'
"    exec "source " . $HOME . "/.vim/hostnames/michael-VirtualBox.vim"
"else
"    exec "source " . $HOME . "/.vim/hostnames/michael-VirtualBox.vim"
"endif


let NERDTreeShowHidden=1

if has('gui_macvim')
    colorscheme solarized
else
    colorscheme default
endif

map <F5> "+y
map <F9> "+p

hi VertSplit guifg=gray guibg=gray

" -----------------------------
" -----------------------------
" --------  Templates  --------
" -----------------------------
" -----------------------------

" add templates in templates/ using filetype as file name
"if has("win32") || has ('win64')
"    let $VIMHOME = $HOME."\\vimfiles\\"
"else
"    let $VIMHOME = $HOME."/.vim/"
"endif
"au BufNewFile * :silent! exec ":0r ".$VIMHOME."templates\\".&ft.".".&ft
"au BufNewFile,BufRead * call InsertFtTemplate()

