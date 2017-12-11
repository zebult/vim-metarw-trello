"=============================================================================
" File: vim-metarw-trello.vim
" Author: a14198
" Created: 2017-12-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_vim-metarw-trello')
    finish
endif
let g:loaded_vim-metarw-trello = 1

let s:save_cpo = &cpo
set cpo&vim



let &cpo = s:save_cpo
unlet s:save_cpo
