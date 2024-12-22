key = vim.keymap.set
ld = '<leader>'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'
require 'keymaps'
require 'lazy-plugins'

require 'cmd'

vim.cmd.colorscheme 'gruvbox-material'
