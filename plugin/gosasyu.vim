scriptencoding utf-8

if exists('g:loaded_gosasyu')
  finish
endif
let g:loaded_gosasyu = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 Gosasyu call gosasyu#gosasyu(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
