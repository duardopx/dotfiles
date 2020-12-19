" AutoGroups
augroup LineNumbers
    autocmd!
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
augroup END

augroup CursorLine
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

augroup Indentation
    autocmd!
    au BufRead,BufNewFile *.py set expandtab
    au BufRead,BufNewFile *.c set noexpandtab
    au BufRead,BufNewFile *.h set noexpandtab
    au BufRead,BufNewFile Makefile* set noexpandtab
augroup END

augroup GitCommitFormat
    autocmd!
    autocmd FileType gitcommit set textwidth=72
    set colorcolumn=+1
    autocmd FileType gitcommit set colorcolumn+=51
augroup END

augroup NoPasteAfterLeavingInsertMode
    autocmd!
    au InsertLeave * silent! set nopaste
augroup END

augroup GoyoConfig
    autocmd!
    autocmd User GoyoEnter Limelight0.2 | call <SID>goyo_enter()
    autocmd User GoyoLeave Limelight! | call <SID>goyo_leave()
augroup END


" Goyo
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

