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
