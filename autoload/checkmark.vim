function! checkmark#checkbox_add() " {{{1
    if checkmark#has_box()
        return
    endif
    silent!s/\(\s*\%(-\|[0-9]\+.\)\s\+\)\([^[].*$\)/\1[ ] \2
    nohlsearch
endfunction

function! checkmark#checkbox_remove() " {{{1
    if !checkmark#has_box()
        return
    endif
    silent!s/\[[x ]\] //
    nohlsearch
endfunction

function! checkmark#checkbox_tick() " {{{1
    if !checkmark#has_box()
        call checkmark#checkbox_add()
    endif
    silent!s/\[ \]/\[x\]/
    nohlsearch
endfunction

function! checkmark#checkbox_untick() " {{{1
    if !checkmark#has_box()
        return
    endif
    silent!s/\[x\]/\[ \]/
    nohlsearch
endfunction

function! checkmark#has_box() " {{{1
    return checkmark#has_ticked_box() || checkmark#has_empty_box()
endfunction

function! checkmark#has_ticked_box() " {{{1
    return (getline(".") =~ "\\[x\\]")
endfunction

function! checkmark#has_empty_box() " {{{1
    return (getline(".") =~ "\\[ \\]")
endfunction

function! checkmark#toggle() " {{{1
    if !checkmark#has_box()
        call checkmark#checkbox_add()
        call checkmark#checkbox_tick()
    elseif checkmark#has_empty_box()
        call checkmark#checkbox_tick()
    elseif checkmark#has_ticked_box()
        call checkmark#checkbox_tick()
        call checkmark#checkbox_untick()
    endif
endfunction

function! checkmark#rotate() " {{{1
    if !checkmark#has_box()
        call checkmark#checkbox_add()
    elseif checkmark#has_empty_box()
        call checkmark#checkbox_tick()
    elseif checkmark#has_ticked_box()
        call checkmark#checkbox_remove()
    end
endfunction

