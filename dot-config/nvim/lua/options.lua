--  :help option-list

-- search option
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.showmode = false

-- Line number
vim.o.number = true
vim.o.relativenumber = true
vim.wo.signcolumn = 'yes' -- keep signcolumn space

-- Status bar
vim.o.statusline = [[%=%l/%L ]]
vim.o.laststatus = 2

-- Tab                                      -- trying sleuth
-- vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
-- augroup('setIndent', { clear = true })
-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- augroup('setIndent', { clear = true })
-- autocmd('Filetype', {
--   group = 'setIndent',
--   pattern = {
--     -- "html",
--     -- "htmldjango",
--     -- "css",
--     -- "json",
--     -- "lua",
--     -- "javascript",
--     -- "markdown",
--     -- "text",
--     -- "vimwiki",
--     -- "java",
--     -- "javascriptreact",
--     -- "php",
--   },
--   command = [[setlocal shiftwidth=2 tabstop=2]],
-- })

vim.o.backup = false
vim.o.swapfile = false

vim.o.guicursor = 'n:hor25,i:ver20,c:ver20,v:block'

vim.o.hidden = true
vim.o.scrolloff = 8

vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect,menu'
vim.o.termguicolors = true

---------------------------------------------------------------

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
