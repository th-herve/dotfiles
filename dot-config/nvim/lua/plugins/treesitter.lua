---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',

  branch = "main",

  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = "main" },
    'windwp/nvim-ts-autotag',
  },
  build = ':TSUpdate',

  vim.keymap.set({ "x", "o" }, "af", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
  end),
  vim.keymap.set({ "x", "o" }, "if", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
  end),
  vim.keymap.set({ "x", "o" }, "ac", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
  end),
  vim.keymap.set({ "x", "o" }, "ic", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
  end)
}
