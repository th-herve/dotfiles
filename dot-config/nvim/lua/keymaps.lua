key({ 'i' }, 'jk', '<Esc>')

-- Remap for dealing with word wrap
key('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
key('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
key('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
key('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- clear highlight search
key('n', '<Esc>', '<cmd>nohlsearch<CR>')
key('n', ld .. 'cc', ':nohlsearch<CR> <Esc>', { silent = true })

-- Navigation
key('n', ld .. 'v', ':vsplit<CR>', { silent = true })
key('n', '<M-l>', ':bnext<CR>', { silent = true })
key('n', '<M-h>', ':bprevious<CR>', { silent = true })
key({ 'n', 'o', 'v' }, 'L', '$')
key({ 'n', 'o', 'v' }, 'H', '^')

-- Operation
key('n', ld .. 'q', ':bd<CR>', { silent = true, desc = 'close buffer' }) -- close current buffer without saving
key('n', ld .. 's', ':w<CR>', { silent = true, desc = 'save buffer' })

-- Scrolling
key('n', '<A-j>', '<C-e>', { silent = true })
key('n', '<A-k>', '<C-y>', { silent = true })
key('n', '<C-d>', '<C-d>zz', { silent = true })
key('n', '<C-u>', '<C-u>zz', { silent = true })
key('n', '<M-d>', '<C-d>', { silent = true })
key('n', '<M-u>', '<C-u>', { silent = true })
key('n', 'n', 'nzzzv', { silent = true })
key('n', 'N', 'Nzzzv', { silent = true })
key('n', '<C-o>', '<C-o>zz')
key('n', '<C-i>', '<C-i>zz')

-- emacs binding in insert and command mode
key({ 'i', 'c' }, '<C-b>', '<left>')
key({ 'i', 'c' }, '<C-f>', '<right>')
key({ 'i', 'c' }, '<M-b>', '<C-left>')
key({ 'i', 'c' }, '<M-f>', '<C-right>')
key({ 'i', 'c' }, '<C-a>', '<Home>')
key({ 'i', 'c' }, '<C-e>', '<End>')
key({ 'i', 'c' }, '<C-d>', '<Delete>')
key('i', '<M-d>', '<Esc>ldwi', { noremap = true, silent = true })

-- Text edit
key('n', ld .. 'a', 'ggVG', { desc = 'select all file' })
key('v', ld .. 'a', '<Esc>', { desc = 'deselect' })
key('n', 'yaa', ':%y<Esc>', { silent = true })
key('v', '<', '<gv', { silent = true })
key('v', '>', '>gv', { silent = true })
-- ld+char to add it at the end of the line
for _, c in ipairs { ';', '.', ',', ':', '>' } do
  key('n', ld .. c, 'A' .. c .. '<Esc>', { desc = 'append ' .. c .. ' to line' })
end

-- Quickfix
key('n', ld .. 'cp', ':cp<CR>zz', { desc = 'Quickfix [P]revious' })
key('n', ld .. 'cn', ':cn<CR>zz', { desc = 'Quickfix [N]ext' })

-- Others
key('n', ld .. 'oo', ':setlocal spell!<CR>', { silent = true, desc = 'set spell' })
key('n', ld .. 'of', ':setlocal spelllang=fr<CR>', { desc = 'set Fr spell' })
key('n', ld .. 'oe', ':setlocal spelllang=en<CR>', { desc = 'set En spell' })
-- key("n", ld .. "F", ":Format<CR>", { desc = "[F]ormat" })

-- Past 0 register (usefull when deleting something, for pasting last yanked text)
key('n', ld .. 'p', '"0p', { desc = 'past last yanked' })

--------------------------------------------------------------

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
