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

" }}}1
"
"" HANDLING CHECKBOXES
"" 
"" :Check will add, if none exists
"" Will toggle, if exists
"" Will clear, if 'off' is 1 (e.g. if :Check!)
"" :Uncheck will clear all (or only selected) checkboxes
"" :RMCheck will delete lines with checked boxes
function! s:checkbox_toggle()
    if getline(".") !~ "\[[x ]\]"
        silent!s/\(\s*\%(-\|[0-9]\+.\)\s\+\)\([^[].*$\)/\1[ ] \2
    elseif getline(".") =~ "\\[ \\]"
        silent!s/\[ \]/\[x\]/
    elseif getline(".") =~ "\\[x\\]"
        silent!s/\[x\]/\[ \]/
    endif
endfunction
function! s:checkbox_delete()
    silent!s/\[[x ]\] //
    silent!/aksjdasd
endfunction
"command! -range CheckToggle <line1>,<line2>call s:checkbox_toggle()
"command! -range Uncheck <line1>,<line2>call s:checkbox_delete()
"command! RMCheck :%Uncheck

command! -range CheckToggle <line1>,<line2>call s:checkbox_toggle()
command! -range Uncheck <line1>,<line2>call s:checkbox_delete()
command! -range CheckRotate <line1>,<line2>call s:checkbox_rotate()
command! RMCheck :%Uncheck

if !exists("g:checkmark_no_mappings") || !g:checkmark_no_mappings
    nnoremap <leader>x :CheckToggle<CR>
    vnoremap <leader>x :'<,'>CheckToggle<CR>
    nnoremap <leader>X :Uncheck<CR>
    vnoremap <leader>X :'<,'>Uncheck<CR>
endif

let &cpo = s:cpo_save

" vim:set et sw=2 sts=2:
