--    _  _  ____  __  __  ____   ___ 
--   ( \/ )(_  _)(  \/  )(  _ \ / __)
--    \  /  _)(_  )    (  )   /( (__ 
--     \/  (____)(_/\/\_)(_)\_) \___)

-- +-------------------------------+
-- |       General settings        |
-- +-------------------------------+

local api = vim.api
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

opt.relativenumber = true
opt.number = true
opt.hidden = true
opt.splitright = true
opt.showmatch = true

opt.guicursor = "n:hor25,i:ver20,c:ver20,v:block"

opt.clipboard = "unnamedplus"

opt.scrolloff = 8

opt.termguicolors = true

--    === Status bar === 

opt.statusline = "%=%l/%L"
opt.laststatus = 2
opt.showmode = false
opt.winbar = "%t"


--       === Tab ===

opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

cmd("autocmd FileType html       setlocal shiftwidth=2 tabstop=2")
cmd("autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2")
cmd("autocmd FileType css        setlocal shiftwidth=2 tabstop=2")
cmd("autocmd FileType json       setlocal shiftwidth=2 tabstop=2")
cmd("autocmd FileType javascript setlocal shiftwidth=2 tabstop=2")
cmd("autocmd FileType markdown   setlocal shiftwidth=2 tabstop=2")
cmd("autocmd FileType text       setlocal shiftwidth=2 tabstop=2")
cmd("autocmd FileType vimwiki    setlocal shiftwidth=2 tabstop=2")

--       === Fold ===

opt.foldmethod = "indent"
opt.foldnestmax = 4
opt.foldignore = ""
opt.foldtext = "CustomFoldText()"
opt.fillchars = { fold = " " }
cmd("autocmd FileType html setlocal foldnestmax=8")

--      === Other ===

opt.spelllang = "en_us"
cmd("set spellsuggest+=10")

opt.completeopt:remove("preview")

opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false

-- +-------------------------------+
-- |           Keybinds            |
-- +-------------------------------+

vim.keymap.set("n", "<Space>", "<nop>", { noremap = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })


vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", "<C-w>w", { noremap = true })

vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true })

vim.keymap.set("n", "<leader>h", ":if bufloaded(expand('~/.config/nvim/doc/keybind.md')) | execute ':w' | execute 'bwipeout! ~/.config/nvim/doc/keybind.md' | else | vsplit | vertical resize 38 | edit ~/.config/nvim/doc/keybind.md | endif<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })

api.nvim_set_keymap('n', '<C-S-J>', [[:m .+1<CR>==]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-S-k>', [[:m .-2<CR>==]], { noremap = true, silent = true })
api.nvim_set_keymap('i', '<C-j>', [[<Esc>:m .+1<CR>==gi]], { noremap = true, silent = true })
api.nvim_set_keymap('i', '<C-k>', [[<Esc>:m .-2<CR>==gi]], { noremap = true, silent = true })
api.nvim_set_keymap('x', '<C-j>', [[:m '>+1<CR>gv=gv]], { noremap = true, silent = true })
api.nvim_set_keymap('x', '<C-k>', [[:m '<-2<CR>gv=gv]], { noremap = true, silent = true })

-- file navigation/operation
api.nvim_set_keymap('n', '<M-l>', [[:bnext<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<M-h>', [[:bprevious<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Leader>s', [[:w<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Leader>q', [[:w<CR>:bd<CR>]], { noremap = true, silent = true })

api.nvim_set_keymap('n', '<A-j>', [[<C-e>]], { noremap = true })
api.nvim_set_keymap('n', '<A-k>', [[<C-y>]], { noremap = true })

api.nvim_set_keymap('n', '<M-v>', [[<C-v>]], { noremap = true })

api.nvim_set_keymap('n', '<Leader>cc', [[:nohlsearch<CR> <Esc>]], { noremap = true, silent = true })

api.nvim_set_keymap('n', '<Leader>o', [[:setlocal spell!<CR>]], { noremap = true, silent = true })

-- reselect indentation
api.nvim_set_keymap('x', '<', [[<gv]], { noremap = true })
api.nvim_set_keymap('x', '>', [[>gv]], { noremap = true })

-- Map Tab key to trigger completion with coc.nvim
api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-y>" : "\<Tab>"]], { expr = true })

api.nvim_set_keymap('n', '<Leader>ff', [[:Telescope find_files<CR>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>fg', [[:Telescope live_grep<CR>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>fb', [[:Telescope buffers<CR>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>fh', [[:Telescope help_tags<CR>]], { noremap = true })

api.nvim_set_keymap('n', '<C-d>', [[<C-d>zz]], { noremap = true })
api.nvim_set_keymap('n', '<C-u>', [[<C-u>zz]], { noremap = true })
api.nvim_set_keymap('n', 'n', [[nzzzv]], { noremap = true })
api.nvim_set_keymap('n', 'N', [[nzzzv]], { noremap = true })

api.nvim_set_keymap('n', '<Leader>u', [[:UndotreeToggle<CR>]], { noremap = true, silent = true })

api.nvim_set_keymap('n', '<Leader>;', [[A;<Esc>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>.', [[A.<Esc>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>,', [[A,<Esc>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>:', [[A:<Esc>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>>', [[A><Esc>]], { noremap = true })

api.nvim_set_keymap('n', '<Leader><Space>', [[za]], { noremap = true })

api.nvim_set_keymap('i', 'jk', [[<Esc>]], { noremap = true })
api.nvim_set_keymap('i', '<C-n>', [[<Esc>]], { noremap = true })

api.nvim_set_keymap('x', 'hj', [[<Esc>]], { noremap = true })

api.nvim_set_keymap('c', 'jk', [[<Esc>]], { noremap = true })


api.nvim_set_keymap('n', '<M-d>', [[<C-d>zz]], { noremap = true })
api.nvim_set_keymap('n', '<M-u>', [[<C-u>zz]], { noremap = true })

api.nvim_set_keymap('n', '<Leader>cl', [[:ColorizerToggle<CR>]], { noremap = true, silent = true })

-- Git fugitive
api.nvim_set_keymap('n', '<Leader>gs', [[:Git status<CR>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>ga.', [[:Git add .<CR>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>gaw', [[:Gw<CR>]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>gcm', [[:Git commit -m "]], { noremap = true })
api.nvim_set_keymap('n', '<Leader>gp', [[:Git push]], { noremap = true })


api.nvim_set_keymap('c', '<C-b>', [[<Left>]], { noremap = true })
api.nvim_set_keymap('c', '<C-f>', [[<Right>]], { noremap = true })
api.nvim_set_keymap('c', '<M-b>', [[<C-Left>]], { noremap = true })
api.nvim_set_keymap('c', '<M-f>', [[<C-Right>]], { noremap = true })
api.nvim_set_keymap('c', '<C-a>', [[<Home>]], { noremap = true })
api.nvim_set_keymap('c', '<C-e>', [[<End>]], { noremap = true })

api.nvim_set_keymap('i', '<C-b>', [[<Left>]], { noremap = true })
api.nvim_set_keymap('i', '<C-f>', [[<Right>]], { noremap = true })
api.nvim_set_keymap('i', '<M-b>', [[<C-Left>]], { noremap = true })
api.nvim_set_keymap('i', '<M-f>', [[<C-Right>]], { noremap = true })
api.nvim_set_keymap('i', '<C-a>', [[<Home>]], { noremap = true })
api.nvim_set_keymap('i', '<C-e>', [[<End>]], { noremap = true })

api.nvim_set_keymap('n', 'L', [[<C-e>]], { noremap = true })
api.nvim_set_keymap('n', 'H', [[<C-o>]], { noremap = true })

api.nvim_set_keymap('n', '<C-I>', [[<C-O>]], { noremap = true })
api.nvim_set_keymap('n', '<C-O>', [[<C-I>]], { noremap = true })

-- +-------------------------------+
-- |           Plugins             |
-- +-------------------------------+



-- +-------------------------------+
-- |         Color scheme          |
-- +-------------------------------+


cmd("highlight StatusLine guibg=none")
cmd("highlight StatusLineNC guibg=none")
cmd("highlight CursorLine guibg=none")
cmd("highlight Folded guibg=none")
cmd("highlight MatchParen guibg=none")


-- +-------------------------------+
-- |         Abbreviations         |
-- +-------------------------------+

cmd("cabbrev fi !firefox index.html")

-- Autocommands
cmd('autocmd FileType python     iabbrev inem if __name__ == "__main__jkA:jko')
cmd('autocmd FileType javascript iabbrev clo console.log();jkhi')
cmd('autocmd FileType javascript iabbrev dcel document.createElement("");jkhhi')
cmd('autocmd FileType javascript iabbrev dceld document.createElement("div");')
