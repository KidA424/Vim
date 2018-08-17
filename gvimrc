" MacVim Settings
" NOTE: This is all only macvim settings because it seems that certain things
" like macmenu only work if they are in gvimrc, not if they are in vimrc

" Set font and font size. NOTE: This will not work without powerline fonts
" installed on your OS
if has('gui_macvim')

  " Disable that lol-able bell that sounds when you try to do an invalid command
  autocmd! GUIEnter * set vb t_vb=

  " We need to disable some standard macvim menu items in order to be able to
  " remap them later. For example, in order to map <d-p> to CtrlP we need to first
  " disable the difault system File > Print mapping.
  macmenu File.Print key=<nop>
"  macmenu File.New\ Tab key=<nop>
  macmenu Edit.Find.Find\.\.\. key=<nop>
  macmenu Tools.Spelling.To\ Next\ Error key=<nop>
  macmenu Window.Select\ Next\ Tab key=<nop>
  macmenu Window.Select\ Previous\ Tab key=<nop>

"  set guifont=Meslo\ LG\ S\ for\ Powerline:h14
endif
"-------- NEW MAPPINGS HERE --------
