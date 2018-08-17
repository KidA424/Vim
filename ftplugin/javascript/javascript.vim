"                                       ------------------------------------
"                                       ------------------------------------
"                                       -----------  Javascript  -----------
"                                       ------------------------------------
"                                       ------------------------------------

nnoremap <buffer> <S-F1> :!start node -r "%:p"<CR>

set tabstop=2
set softtabstop=2
set shiftwidth=2

"Set ctrl-p working directory to path containing Root.js
let g:ctrlp_root_markers = ['Root.js']

