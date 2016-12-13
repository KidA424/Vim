" Vim filetype plugin
" Language: Vue.js
" Maintainer: Eduardo San Martin Morote
" Author: Adriaan Zonnenberg

set formatoptions-=cro

if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/html.vim
