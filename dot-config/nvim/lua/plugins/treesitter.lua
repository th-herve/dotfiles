---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
  },
  build = ':TSUpdate',

  opts = {
    ensure_installed = {
      'lua',
      'python',
      'javascript',
      'vimdoc',
      'vim',
      'bash',
      'sql',
      'regex',
      'markdown',
      'php',
    },

    autotag = {
      enable = true,
    },

    auto_install = true,

    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { '' },
    },
    indent = { enable = true, disable = { '' } },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },

    textobjects = {
      enable = true,
      border = 'none',
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
  },
  config = function(_, opts)
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

    vim.filetype.add {
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    }

    -- manually add blade parser
    ---@diagnostic disable-next-line: inject-field
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }
  end,
}
