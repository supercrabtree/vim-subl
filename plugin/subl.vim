if exists('g:loaded_subl') || !executable('subl')
  finish
endif
let g:loaded_subl = 1

function! s:Subl(allfiles)
    let l:root = system('cd ' . expand('%:h') . ' && git rev-parse --show-toplevel')[:-2]
    if (v:shell_error)
        let l:root = getcwd() . ' ' . expand('%:h')
    endif
    if (a:allfiles)
        let l:bufnumbers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
        let l:bufnames = map(bufnumbers, 'bufname(v:val)')
        let l:validbufnames = filter(bufnumbers, 'filereadable(v:val)')
        let l:validbufnames = filter(validbufnames, 'v:val != expand("%")')
        let l:validbufnames = add(validbufnames, expand('%'))
        let l:files = join(l:validbufnames, ' ')
    else
        let l:files = expand('%')
    endif
    execute 'silent !subl -n' l:root l:files
    redraw!
endfunction

command! -nargs=0 -bang Subl call s:Subl(<bang>0)
