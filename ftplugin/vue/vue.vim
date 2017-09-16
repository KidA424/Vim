" Vim filetype plugin
" Language: Vue.js
" Maintainer: Eduardo San Martin Morote
" Author: Adriaan Zonnenberg

set formatoptions-=cro

set expandtab
set shiftwidth=2
set softtabstop=2

if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/html.vim
