---@diagnostic disable: undefined-global
--  _  _  ____  _____  _  _  ____  __  __
-- ( \( )( ___)(  _  )( \/ )(_  _)(  \/  )
--  )  (  )__)  )(_)(  \  /  _)(_  )    (
-- (_)\_)(____)(_____)  \/  (____)(_/\/\_)

-- +-------------------------------+
-- |       General settings        |
-- +-------------------------------+

local color = 'gruvbox-material'

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local key = vim.keymap.set
local ld = '<leader>'

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

-- Tab
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = {
    'html',
    'htmldjango',
    'css',
    'json',
    'lua',
    'javascript',
    'markdown',
    'text',
    'vimwiki',
    'java',
    'javascriptreact',
    'nix',
    'blade',
  },
  command = [[setlocal shiftwidth=2 tabstop=2]],
})

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

-- remove auto comment on new line
vim.cmd [[
  autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]]

-- +-------------------------------+
-- |           Keybinds            |
-- +-------------------------------+

key({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Mode switch
--key("i", "<Esc>", "<Nop>")
key({ 'i' }, 'jk', '<Esc>')

-- Remap for dealing with word wrap
key('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
key('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
key('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
key('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Navigation/operation
key('n', ld .. 'v', ':vsplit<CR>', { silent = true })
key('n', '<M-l>', ':bnext<CR>', { silent = true })
key('n', '<M-h>', ':bprevious<CR>', { silent = true })
key('n', ld .. 's', ':w<CR>', { silent = true })
key({ 'n', 'o', 'v' }, 'L', '$')
key({ 'n', 'o', 'v' }, 'H', '^')

-- close buffer
key('n', ld .. 'q', ':bd<CR>', { silent = true }) -- close current buffer without saving

key('n', '<C-o>', '<C-o>zz')
key('n', '<C-i>', '<C-i>zz')

-- Scrolling
key('n', '<A-j>', '<C-e>', { silent = true })
key('n', '<A-k>', '<C-y>', { silent = true })
key('n', '<C-d>', '<C-d>zz', { silent = true })
key('n', '<C-u>', '<C-u>zz', { silent = true })
key('n', '<M-d>', '<C-d>', { silent = true })
key('n', '<M-u>', '<C-u>', { silent = true })
key('n', 'n', 'nzzzv', { silent = true })
key('n', 'N', 'Nzzzv', { silent = true })

-- emacs binding in insert and command mode
key({ 'i', 'c' }, '<C-b>', '<left>')
key({ 'i', 'c' }, '<C-f>', '<right>')
key({ 'i', 'c' }, '<M-b>', '<C-left>')
key({ 'i', 'c' }, '<M-f>', '<C-right>')
key({ 'i', 'c' }, '<C-a>', '<Home>')
key({ 'i', 'c' }, '<C-e>', '<End>')

-- Text edit
key('n', ld .. 'a', 'ggVG')
key('v', ld .. 'a', '<Esc>')
key('n', 'yaa', ':%y<Esc>', { silent = true })
key('v', '<', '<gv', { silent = true })
key('v', '>', '>gv', { silent = true })
-- ld+char to add it at the end of the line
for _, c in ipairs { ';', '.', ',', ':', '>' } do
  key('n', ld .. c, 'A' .. c .. '<Esc>')
end

-- Quickfix
key('n', ld .. 'cp', ':cp<CR>zz', { desc = 'Quickfix [P]revious' })
key('n', ld .. 'cn', ':cn<CR>zz', { desc = 'Quickfix [N]ext' })

-- Others
key('n', ld .. 'cc', ':nohlsearch<CR> <Esc>', { silent = true })
key('n', ld .. 'oo', ':setlocal spell!<CR>', { silent = true })
key('n', ld .. 'of', ':setlocal spelllang=fr<CR>')
key('n', ld .. 'oe', ':setlocal spelllang=en<CR>')
-- key("n", ld .. "F", ":Format<CR>", { desc = "[F]ormat" })

-- Past 0 register (usefull when deleting something, for pasting last yanked text)
key('n', ld .. 'p', '"0p')

-- +-------------------------------+
-- |     Lazy.nvim installation    |
-- +-------------------------------+

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- +-------------------------------+
-- |        Plugins config         |
-- +-------------------------------+

local config_path = vim.fn.stdpath 'config'

-- Add the configuration directory to the Lua package path
package.path = package.path .. ';' .. config_path .. '/?.lua;' .. config_path .. '/?/init.lua'

require('lazy').setup({

  'tpope/vim-commentary',
  'tpope/vim-surround',
  'jiangmiao/auto-pairs',
  'tpope/vim-repeat',
  'mg979/vim-visual-multi',

  {

    'tpope/vim-fugitive',

    dependencies = {
      'sindrets/diffview.nvim',
    },

    config = function()
      key('n', 'gs', ':G status<CR>')
      key('n', 'ga.', ':Git add .<CR>')
      key('n', 'gaw', ':Gw<CR>')
      key('n', 'gcm', ":Git commit -m '")
      key('n', 'gco', ':Git checkout ')
      key('n', 'gp', ':Git push<CR>')
      -- key("n", "gh", ":diffget //2<CR>")
      -- key("n", "gl", ":diffget //3<CR>")

      local actions = require 'diffview.actions'

      require('diffview').setup {
        view = {
          merge_tool = {
            layout = 'diff1_plain',
          },
        },
        keymaps = {
          view = {
            {
              'n',
              'gh',
              actions.conflict_choose 'ours',
              { desc = 'Choose the OURS version of a conflict' },
            },
            {
              'n',
              'gl',
              actions.conflict_choose 'theirs',
              { desc = 'Choose the THEIRS version of a conflict' },
            },
          },
        },
      }
      key('n', ld .. 'gdo', ':DiffviewOpen<CR>')
      key('n', ld .. 'gdc', ':DiffviewClose<CR>')

      -- toggle fugitive status with ld..gs
      local function showFugitiveGit()
        if vim.fn.FugitiveHead() ~= '' then
          vim.cmd [[ tab Git ]]
          vim.cmd [[ execute ":set nonumber norelativenumber" ]]
        end
      end

      local function toggleFugitiveGit()
        if vim.fn.buflisted(vim.fn.bufname 'fugitive:///*/.git//$') ~= 0 then
          print 'boo'
          vim.cmd [[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]]
        else
          showFugitiveGit()
        end
      end
      key('n', ld .. 'gs', toggleFugitiveGit, opts) -- has to use the leader key, otherwise it won't close

      vim.cmd [[
        autocmd BufNewFile COMMIT_EDITMSG exec set nonumber norelativenumber
      ]]
    end,
  },

  -- lazy.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      notify = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
    },
  },

  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      skip_confirm_for_simple_edits = true,
      show_hidden = true,
      keymaps = {
        ['<BS>'] = 'actions.parent',
        ['<leader>b'] = 'actions.close',
      },
    },
    key = {
      key(
        'n',
        '<leader>b',
        ':Oil --float<CR>:set nonumber norelativenumber<CR>:highlight EndOfBuffer guifg=#1D2021<CR>',
        { silent = true }
      ),
    },
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup()
      harpoon:setup {
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      }
      vim.keymap.set('n', '<C-p>', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-h>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<M-a>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<M-s>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<M-f>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<M-/>', function()
        harpoon:list():select(4)
      end)
    end,
  },

  -- {
  --   'akinsho/toggleterm.nvim',
  --   version = '*',
  --   opts = {
  --     open_mapping = [[<M-m>]],
  --     shade_terminals = true,
  --     direction = 'float',
  --     float_opts = { border = 'single' },
  --     highlight = { Normal = { guibg = '#11111b' } },
  --   },
  -- },

  {
    'mattn/emmet-vim',
    -- lazy = true,
    init = function()
      vim.cmd [[ let g:user_emmet_leader_key='<M-,>' ]]
    end,
  },

  {
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
  },

  {
    'mbbill/undotree',
    key = {
      vim.keymap.set({ 'n', 'o', 'x' }, '<leader>u', '<cmd>UndotreeToggle<CR>'),
    },
    config = function()
      vim.cmd [[ set undodir=~/.undodir_combined ]]
      vim.cmd [[ set undofile ]]
      vim.cmd [[ set undolevels=100000 ]]
      vim.cmd [[ let g:undotree_SetFocusWhenToggle = 1 ]]
    end,
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      'rafamadriz/friendly-snippets',

      'onsails/lspkind.nvim',
    },
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
  },

  -- ui
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = function()
      vim.api.nvim_set_hl(0, 'FloatTitle', { link = 'Title' })
      vim.cmd [[
        highlight FloatBorder guibg=none
        highlight NormalFloat guibg=none
      ]]
    end,
  },

  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
    end,
  },

  {
    'rose-pine/neovim',
    priority = 1000,
  },
  {
    'catppuccin/nvim',
    priority = 1000,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
  },

  {
    'vimwiki/vimwiki',
    init = function()
      vim.cmd [[
        filetype plugin on
        syntax on
        let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/docs',
                    \ 'syntax': 'markdown', 'ext': '.md'}]
        let g:vimwiki_path = '~/.config/nvim/vimwiki/docs'
        let g:vimwiki_markdown_link_ext = 1
        imap <C-space> <Plug>VimwikiTableNextCell
        nmap <Leader>wn <Plug>VimwikiRemoveSingleCB " just here to remove the gl keybind used with fugitive
      ]]
    end,
  },

  {
    'folke/which-key.nvim',
    opts = {
      window = {
        border = 'single',
      },
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        php = { { 'pint', 'php-cs-fixer', 'intelephense' } },
        blade = { 'blade-formatter', 'prettierd', 'prettier' },
        javascript = { { 'prettierd', 'prettier' } },
        html = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        python = { 'isort', 'black' },

        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
  },

  -- {
  --   dir = '~/programming/project/sline-nvim/', -- Your path
  --   name = 'sline',
  --   opts = {
  --     depth = 1,
  --     status_line = false,
  --     unamed_buffer_label = 'new',
  --   },
  --   -- config = function()
  --   --   require('winbar')
  --   -- end
  -- },
  require 'plugins.debug',
}, {
  -- Lazy config
  ui = {
    border = 'rounded',
  },
})

-- [[ Configure Telescope ]]
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

require('lazydev').setup()

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path

-- Custom live_grep function to search in git root

vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind buffers' })
vim.keymap.set(
  'n',
  '<leader>/',
  require('telescope.builtin').current_buffer_fuzzy_find,
  { desc = '[/] Fuzzily search in current buffer' }
)
key('n', '<leader>fgf', require('telescope.builtin').git_files, { desc = '[F]ind [G]it [F]iles' })
key('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
key('n', '<leader>fgg', require('telescope.builtin').live_grep, { desc = '[F]ind [G]rep' })
key('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
key('n', '<leader>ft', require('telescope.builtin').colorscheme, { desc = '[F]ind [T]heme' })
key('n', '<leader>fr', require('telescope.builtin').registers, { desc = '[F]ind [R]egisters' })
key('n', '<leader>fc', require('telescope.builtin').command_history, { desc = '[F]ind [c]ommand history' })
key('n', '<leader>fgb', require('telescope.builtin').git_branches, { desc = '[F]ind [G]it [B]ranch' })

-- [[ Configure Treesitter ]]
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'c',
      'lua',
      'python',
      'javascript',
      'typescript',
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
    sync_install = false,
    ignore_install = {},
    modules = {},

    highlight = { enable = true },
    indent = { enable = true },
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
      select = {

        enable = true,

        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>S'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', function()
    require('telescope.builtin').lsp_document_symbols { symbols = 'function' }
  end, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>fh', require('telescope.builtin').help_tags, '[F]ind [H]elp tags')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  vim.diagnostic.config {
    float = { border = 'rounded' },
  }

  require('lspconfig.ui.windows').default_options = {
    border = 'single',
  }
end

local signs = { Error = ' ', Warn = ' ', Hint = '󰌵 ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- mason-lspconfig requires that these setup functions are called in this order
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  clangd = {
    format = {
      style = 'llvm',
      indentWidth = 4,
      columnLimit = 100,
    },
  },
  -- gopls = {},
  pyright = {},
  -- rust_analyzer = {},
  tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs', 'blade' } },
  cssls = {},
  tailwindcss = { filetypes = { 'javascript', 'javascriptreact', 'typescriptreact', 'php', 'blade' } },
  emmet_ls = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass' },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },

  intelephense = { filetypes = { 'php', 'blade' } },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    -- ['<Tab>'] = cmp.mapping.confirm { select = true }, -- delete
    ['<CR>'] = cmp.mapping.confirm { select = true },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  formatting = {
    format = require('lspkind').cmp_format {
      maxwidth = 50,
      ellipsis_char = '...',
    },
  },
}

-- +-------------------------------+
-- |            Commands           |
-- +-------------------------------+

-- reopen file at the same line it was when closing
vim.cmd [[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
]]

vim.cmd [[
    autocmd BufNewFile *.sh exec "normal i#!/usr/bin/env bash\<Esc>"

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

-- tweak colorscheme
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
vim.cmd.colorscheme(color)

-- abbrev
vim.cmd [[

    autocmd FileType javascript iabbrev clo console.log();jkhi
    autocmd FileType php        iabbrev clo console.log();jkhi
    autocmd FileType html       iabbrev clo console.log();jkhi

    autocmd FileType c iabbrev pfd printf("%d\n", );jkhhi
    autocmd FileType c iabbrev pfs printf("%s\n", );jkhhi
    autocmd FileType c iabbrev pfc printf("%c\n", );jkhhi


]]

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.blade = {
  install_info = {
    url = 'https://github.com/EmranMR/tree-sitter-blade',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'blade',
}

vim.cmd [[
augroup BladeFiltypeRelated
  au BufNewFile,BufRead *.blade.php set ft=blade
augroup END
]]

local function get_winbar()
  local devicon = require 'nvim-web-devicons'

  local filename = vim.fn.expand '%:t'
  local extension = vim.fn.expand '%:e'

  local dir = vim.fn.expand '%:p:h'

  local split_dir = vim.split(dir, '/') -- break path into all directories
  dir = split_dir[#split_dir] -- get last dir in the path

  local icon, icon_hl = devicon.get_icon(filename, extension, { default = true })
  local win_hl = '%#WinBar#'

  local branch = vim.fn.FugitiveStatusline()

  if branch ~= '' then
    branch = string.match(branch, '%((.*)%)')
    branch = '%#Green#  ' .. win_hl .. branch
  end

  return '%#Directory#󰉋 '
    .. win_hl
    .. dir
    .. '%#Yellow#'
    .. ' > '
    .. '%#'
    .. icon_hl
    .. '#'
    .. icon
    .. win_hl
    .. ' '
    .. filename
    .. '%='
    .. (branch or '')
end

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  callback = function()
    vim.o.winbar = get_winbar()
  end,
})
