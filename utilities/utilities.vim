function! ChangeTabWidth(old, new)
    echom a:old
    let &ts = a:old
    let &sts = a:old
    set noet
    retab!
    let &ts = a:new
    let &sts = a:new
    set et
    retab
endfunction

function! InsertFtTemplate()
    if line('$') == 1 && getline(1) == ''
        if has("win32") || has ('win64')
          let $VIMHOME = $HOME."\\vimfiles\\"
        else
          let $VIMHOME = $HOME."/.vim/"
        endif
        silent! exec ":0r ".$VIMHOME."templates\\template.".&ft
    endif
endfunction
