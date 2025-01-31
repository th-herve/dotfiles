return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    search = {
      mode = function(str) -- match only beginning of words
        return '\\<' .. str
      end,
    },
  },
  key = {
    key({ 'n', 'o', 'x' }, 's', function()
      require('flash').jump()
    end),
  },
}
