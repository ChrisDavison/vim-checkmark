" checkmark.vim - Toggle markdown checkboxes
" Maintainer: Chris Davison <https://chrisdavison.github.io>
" Version: 20200211

" Initialisation {{{1
if exists("g:loaded_checkmark") || &cp || v:version < 700
    finish
endif
let g:loaded_checkmark = 1

let s:cpo_save = &cpo
set cpo&vim

" Command bindings {{{1
command! -range Tick <line1>,<line2>call checkmark#checkbox_tick()
command! -range RTick <line1>,<line2>call checkmark#checkbox_rotate()
command! -range Untick <line1>,<line2>call checkmark#checkbox_untick()
command! -range=% RMCheck <line1>,<line2>call checkmark#checkbox_remove()

" OPTIONAL default bindings {{{1
if !exists("g:checkmark_no_mappings") || !g:checkmark_no_mappings
  nnoremap <leader>x :call checkmark#toggle()<CR>
  vnoremap <leader>x :call checkmark#toggle()<CR>
  nnoremap <leader>X :call checkmark#checkbox_remove()<CR>
  vnoremap <leader>X :call checkmark#checkbox_remove()<CR>
endif

let &cpo = s:cpo_save

" vim:set et sw=2 sts=2:
