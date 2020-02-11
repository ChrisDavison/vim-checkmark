# Checkmark

A simple utility to toggle, uncheck, or remove checkboxes from markdown documents.

Provides commands:

```vim
CheckToggle
    Toggle between empty, and ticked checkbox (on line, range, or visual). If
    no checkbox exists, will add an empty checkbox.

CheckRotate
    Rotate between NO checkbox, empty, and ticked checkbox (on line, range, 
    or visual)

Uncheck
    Remove checkboxes from the current line, range, or visual selection

RMCHeck
    Remove checkboxes from the entire document
```

and mappings (which can be disabled by adding `let g:checkmark_no_mapping=1` to your `.vimrc`):

```vim
nnoremap <leader>x :CheckToggle<CR>
vnoremap <leader>x :'<,'>CheckToggle<CR>
nnoremap <leader>X :Uncheck<CR>
vnoremap <leader>X :'<,'>Uncheck<CR>
```
