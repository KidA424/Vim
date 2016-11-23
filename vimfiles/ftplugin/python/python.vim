"                                       --------------------------------
"                                       --------------------------------
"                                       -----------  Python  -----------
"                                       --------------------------------
"                                       --------------------------------



" -------------------------------
" -------------------------------
" --------  Autocommands --------
" -------------------------------
" -------------------------------


"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" ---------------------------
" ---------------------------
" --------  Options  --------
" ---------------------------
" ---------------------------



setlocal fileformat=unix
setlocal encoding=utf-8

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
"setlocal textwidth=79
setlocal expandtab
setlocal autoindent


"let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1
syntax on

" -------------------------------
" -------------------------------
" --------  Key mappings --------
" -------------------------------
" -------------------------------

nnoremap <buffer> <S-F1> :!start python -i "%"<CR>
nnoremap <buffer> <S-F2> :execute "!start python -i \"" . expand('$HOME') . "\\vimfiles\\resources\\IDEutils.py\""<CR>
