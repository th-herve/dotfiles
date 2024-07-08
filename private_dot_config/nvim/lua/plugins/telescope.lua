return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },

  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },

      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    local builtin = require 'telescope.builtin'

    key('n', '<leader>fb', builtin.buffers, { desc = '[F]ind buffers' })
    key('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
    key('n', '<leader>fgf', builtin.git_files, { desc = '[F]ind [G]it [F]iles' })
    key('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    key('n', '<leader>fgg', builtin.live_grep, { desc = '[F]ind [G]rep' })
    key('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
    key('n', '<leader>ft', builtin.colorscheme, { desc = '[F]ind [T]heme' })
    key('n', '<leader>fr', builtin.registers, { desc = '[F]ind [R]egisters' })
    key('n', '<leader>fc', builtin.command_history, { desc = '[F]ind [c]ommand history' })
    key('n', '<leader>fgb', builtin.git_branches, { desc = '[F]ind [G]it [B]ranch' })
  end,
}
