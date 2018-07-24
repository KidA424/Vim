"                                       --------------------------------
"                                       --------------------------------
"                                       -----------  Python  -----------
"                                       --------------------------------
"                                       --------------------------------

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
"setlocal textwidth=79
setlocal expandtab
setlocal autoindent


" -------------------------------
" -------------------------------
" --------  Key mappings --------
" -------------------------------
" -------------------------------

nnoremap <buffer> <S-F1> :!start python -i "%"<CR>

if hostname == 'KevinKnopf-PC'
    nnoremap <buffer> <S-F4> :execute "!start python -i \"" . expand('$HOME') . "\\vimfiles\\resources\\IDEutils.py\""<CR>
elseif hostname == 'dsp-postgres'
    "Run current script
"    nnoremap <buffer> <S-F1> :!start C:\db_service_test\Applications\Utility_Workbook\Code_Eval\WinPython-64bit-3.4.3.5\WinPython Command Prompt.exe "cd %:p:h & python -i %:p"<CR>
    "Open python IDE with IDEutils
    nnoremap <buffer> <S-F3> :execute "!start C:\\db_service_test\\Applications\\Utility_Workbook\\Code_Eval\\WinPython-64bit-3.4.3.5\\WinPython Command Prompt.exe \"python -i " . expand('$HOME') . "\\vimfiles\\resources\\IDEutils.py\""<CR>
    nnoremap <buffer> <S-F4> :!start python -i %:p<CR>
endif
