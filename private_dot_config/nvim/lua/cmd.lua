-- reopen file at the same line it was when closing
vim.cmd [[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
]]

-- Add shebang when creating a bash script
vim.cmd [[
  autocmd BufNewFile *.sh exec "normal i#!/usr/bin/env bash\<Esc>"
]]

-- Add file name as title of md file
vim.cmd [[
  augroup MarkdownTitle
      autocmd!
      autocmd BufNewFile *.md lua SetMarkdownTitle()
  augroup END
]]
function SetMarkdownTitle()
  if vim.fn.expand '%:t' ~= '' then
    local filename = string.gsub(vim.fn.expand '%:t:r', '_', ' ')
    local capitalized = string.gsub(filename, '%a', string.upper, 1)
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { '# ' .. capitalized })
    vim.cmd 'normal! gg'
    vim.cmd 'normal! zz'
  end
end

-- tweak colorscheme on changes
vim.cmd [[
  autocmd ColorScheme * highlight StatusLine guibg=none
  autocmd ColorScheme * highlight StatusLineNC guibg=none
  autocmd ColorScheme * highlight CursorLine guibg=none
  autocmd ColorScheme * highlight Folded guibg=none
  autocmd ColorScheme * highlight FloatBorder guibg=none
  autocmd ColorScheme * highlight NormalFloat guibg=none
  autocmd ColorScheme * highlight WinBar guibg=none
  autocmd ColorScheme * highlight MatchParen guibg=none
]]

-- abbrev
vim.cmd [[
  autocmd FileType javascript iabbrev clo console.log();jkhi
  autocmd FileType php        iabbrev clo console.log();jkhi
  autocmd FileType html       iabbrev clo console.log();jkhi

  autocmd FileType c iabbrev pfd printf("%d\n", );jkhhi
  autocmd FileType c iabbrev pfs printf("%s\n", );jkhhi
  autocmd FileType c iabbrev pfc printf("%c\n", );jkhhi
]]

-- remove auto comment on new line
vim.cmd [[
  autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]]

-- vim.cmd [[
-- augroup BladeFiltypeRelated
--   au BufNewFile,BufRead *.blade.php set ft=blade
-- augroup END
-- ]]
