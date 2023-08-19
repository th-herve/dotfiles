let g:ale_lint_on_text_changed = 'never'  " Don't lint while typing
let g:ale_lint_on_insert_leave = 0        " Don't lint on insert mode leaving
let g:ale_lint_on_enter = 0               " Don't lint on entering a buffer
let g:ale_sign_column_always = 1          " Always show the sign column
let g:ale_echo_msg_error_str = 'E'        " Set the sign for errors
let g:ale_echo_msg_warning_str = 'W'      " Set the sign for warnings

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_sign_column_always = 0
let g:ale_set_signs = 0
let g:ale_virtualtext_cursor=0

let g:ale_linters = {
      \ 'javascript':   ['eslint'],
      \ 'html':         ['htmlhint'],
      \ 'css':          ['htmlhint'],
      \ }

let g:ale_fixers = {
\   'javascript':   ['prettier'],
\   'css':          ['prettier'],
\   'json':         ['prettier'],
\   'html':         ['prettier'],
\   'cpp':          ['clang'],
\   'c':            ['clang'],
\}

let g:ale_fix_on_save = 1

highlight ALEWarningSign guifg=orange guibg=none
