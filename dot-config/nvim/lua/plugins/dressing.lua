return {
  'stevearc/dressing.nvim',
  enabled = true,
  event = 'VeryLazy',
  config = function()
    vim.api.nvim_set_hl(0, 'FloatTitle', { link = 'Title' })
    vim.cmd [[
        highlight FloatBorder guibg=none
        highlight NormalFloat guibg=none
      ]]
  end,
}
