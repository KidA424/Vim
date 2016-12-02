"                                       --------------------------------
"                                       --------------------------------
"                                       ---  Michael Knopf's _vimrc  ---
"                                       --------------------------------
"                                       --------------------------------

set nocompatible
filetype off
filetype plugin indent on




" ------------------------------
" ------------------------------
" --------  Appearance  --------
" ------------------------------
" ------------------------------
syntax on
colorscheme solarized
set guifont=Lucida_Console:h10:cDEFAULT

"Make title of tab be title of open file
set title



" ---------------------------
" ---------------------------
" --------  Options  --------
" ---------------------------
" ---------------------------

" Tab settings
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
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
set viminfo+=n$VIM/_viminfo

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

nnoremap <C-]> :execute "tabm" tabpagenr()<CR>
nnoremap <C-[> :execute "tabm" tabpagenr() - 2<CR>


" ----------------------------------
" ----------------------------------
" --------  Nerd Commenter  --------
" ----------------------------------
" ----------------------------------

" Turn off starting next line with comment
set formatoptions-=cro

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


let hostname = substitute(system('hostname'), '\n', '', '')

if hostname == 'KevinKnopf-PC'
    exec "source " . $HOME . "\\vimfiles\\hostnames\\KevinKnopf-PC.vim"
elseif hostname == 'dsp-postgres'
    exec "source " . $HOME . "\\vimfiles\\hostnames\\dsp-postgres.vim"
else
    exec "source " . $HOME . "\\vimfiles\\hostnames\\SEC.vim"
endif
