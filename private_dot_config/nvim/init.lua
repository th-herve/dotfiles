---@diagnostic disable: undefined-global
--  _  _  ____  _____  _  _  ____  __  __
-- ( \( )( ___)(  _  )( \/ )(_  _)(  \/  )
--  )  (  )__)  )(_)(  \  /  _)(_  )    (
-- (_)\_)(____)(_____)  \/  (____)(_/\/\_)

-- +-------------------------------+
-- |       General settings        |
-- +-------------------------------+

local color = "gruvbox-material"

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
vim.wo.signcolumn = "yes" -- keep signcolumn space

-- Status bar
vim.o.statusline = [[%=%l/%L ]]
vim.o.laststatus = 2

-- Tab
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("setIndent", { clear = true })
autocmd("Filetype", {
  group = "setIndent",
  pattern = {
    "html",
    "htmldjango",
    "css",
    "json",
    "lua",
    "javascript",
    "markdown",
    "text",
    "vimwiki",
    "java",
    "javascriptreact",
    "php",
  },
  command = [[setlocal shiftwidth=2 tabstop=2]],
})

-- Fold

vim.o.foldmethod = "indent"
vim.o.foldnestmax = 4
vim.o.foldlevel = 99
vim.o.foldignore = ""
vim.cmd([[set fillchars=fold:\ ]])
-- More fold option at the end

-- Other
vim.o.spelllang = "en_us"
vim.o.spellsuggest = 10

vim.o.backup = false
vim.o.swapfile = false

vim.o.guicursor = "n:hor25,i:ver20,c:ver20,v:block"

vim.o.hidden = true
vim.o.scrolloff = 8

vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect,menu"
vim.o.termguicolors = true
vim.o.nocompatible = true

-- remove auto comment on new line
vim.cmd([[
  autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- +-------------------------------+
-- |           Keybinds            |
-- +-------------------------------+

local key = vim.keymap.set
local ld = "<leader>"
key({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mode switch
key("i", "<Esc>", "<Nop>")
key({ "i", "c" }, "jk", "<Esc>")
key("n", "<M-v>", "<C-v>", { silent = true })
key("t", "jk", "<C-\\><C-n>", { silent = true })

-- Remap for dealing with word wrap
key("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
key("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
key("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
key("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
key("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Navigation/operation
key("n", ld .. "v", ":vsplit<CR>", { silent = true })
key("n", ld .. "e", "<C-w>w")
key("n", "<M-l>", ":bnext<CR>", { silent = true })
key("n", "<M-h>", ":bprevious<CR>", { silent = true })
key("n", ld .. "s", ":w<CR>", { silent = true })
key("n", ld .. "q", ":w<CR>:bd<CR>", { silent = true })
key({ "n", "o", "v" }, "L", "$")
key({ "n", "o", "v" }, "H", "^")
key("n", ld .. "<Space>", "za")
key("n", ld .. "i", "<S-s>")
key("n", ld .. "wq", ":wq<cr>")
key("n", ld .. "<S-q>", ":q!<cr>")

key("n", "<C-o>", "<C-o>zz")
key("n", "<C-i>", "<C-i>zz")

-- Scrolling
key("n", "<A-j>", "<C-e>", { silent = true })
key("n", "<A-k>", "<C-y>", { silent = true })
key("n", "<M-d>", "<C-d>", { silent = true })
key("n", "<M-u>", "<C-u>", { silent = true })
key("n", "<C-d>", "<C-d>zz", { silent = true })
key("n", "<C-u>", "<C-u>zz", { silent = true })
key("n", "n", "nzzzv", { silent = true })
key("n", "N", "Nzzzv", { silent = true })

-- emacs binding in insert and command mode
key({ "i", "c" }, "<C-b>", "<left>")
key({ "i", "c" }, "<C-f>", "<right>")
key({ "i", "c" }, "<M-b>", "<C-left>")
key({ "i", "c" }, "<M-f>", "<C-right>")
key({ "i", "c" }, "<C-a>", "<Home>")
key({ "i", "c" }, "<C-e>", "<End>")

-- Text edit
key("n", "<C-S-j>", ":m .+1<CR>==", { silent = true })
key("n", "<C-S-k>", ":m .-2<CR>==", { silent = true })
key("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
key("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { silent = true })
key("v", "<C-k>", ":m '>+1<CR>gv=gv", { silent = true })
key("v", "<C-j>", ":m '<-1<CR>gv=gv", { silent = true })
key("n", ld .. "a", "ggVG")
key("v", ld .. "a", "<Esc>")
key("v", "<", "<gv", { silent = true })
key("v", ">", ">gv", { silent = true })
-- ld+char to add it at the end of the line
for _, c in ipairs({ ";", ".", ",", ":", ">" }) do
  key("n", ld .. c, "A" .. c .. "<Esc>")
end

-- Others
key("n", ld .. "cc", ":nohlsearch<CR> <Esc>", { silent = true })
key("n", ld .. "o", ":setlocal spell!<CR>", { silent = true })
-- Past 0 register (usefull when deleting something, for pasting last yanked text)
key("n", ld .. "p", '"0p')

-- +-------------------------------+
-- |     Lazy.nvim installation    |
-- +-------------------------------+

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- +-------------------------------+
-- |        Plugins config         |
-- +-------------------------------+

require("lazy").setup({

  "tpope/vim-commentary",
  "tpope/vim-surround",
  "jiangmiao/auto-pairs",
  "tpope/vim-repeat",
  "mg979/vim-visual-multi",

  {

    "tpope/vim-fugitive",
    config = function()
      key("n", ld .. "gs", ":Git status<CR>")
      key("n", ld .. "ga.", ":Git add .<CR>")
      key("n", ld .. "gaw", ":Gw<CR>")
      key("n", ld .. "gcm", ':Git commit -m "')
      key("n", ld .. "gp", ":Git push")
    end,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      keymaps = {
        ["<BS>"] = "actions.parent",
        ["<leader>b"] = "actions.close",
      },
    },
    key = {
      key("n", "<leader>b", ":Oil --float<CR>", { silent = true }),
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      })
      vim.keymap.set("n", "<C-p>", function()
        harpoon:list():append()
      end)
      vim.keymap.set("n", "<C-h>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<M-a>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<M-s>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<M-f>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<M-/>", function()
        harpoon:list():select(4)
      end)
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<M-m>]],
      shade_terminals = true,
      direction = "float",
      float_opts = { border = "single" },
      highlight = { Normal = { guibg = "#11111b" } },
    },
  },

  {
    "mattn/emmet-vim",
    init = function()
      vim.cmd([[ let g:user_emmet_leader_key='<M-,>' ]])
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      search = {
        mode = function(str) -- match only beginning of words
          return "\\<" .. str
        end,
      },
    },
    key = {
      key({ "n", "o", "x" }, "s", function()
        require("flash").jump()
      end),
    },
  },

  {
    "mbbill/undotree",
    key = {
      vim.keymap.set({ "n", "o", "x" }, "<leader>u", "<cmd>UndotreeToggle<CR>"),
    },
    config = function()
      vim.cmd([[ set undodir=~/.undodir_combined ]])
      vim.cmd([[ set undofile ]])
      vim.cmd([[ set undolevels=100000 ]])
      vim.cmd([[ let g:undotree_SetFocusWhenToggle = 1 ]])
    end,
  },

  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      "rafamadriz/friendly-snippets",

      "onsails/lspkind.nvim",
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "single",
      },
    },
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
  },

  -- formatter/linter
  -- {
  --   "nvimtools/none-ls.nvim",
  --   config = function()
  --     local null_ls = require("null-ls")

  --     null_ls.setup({
  --       sources = {
  --         null_ls.builtins.formatting.stylua,  -- lua
  --         null_ls.builtins.formatting.black,   -- python
  --         null_ls.builtins.formatting.prettier, -- js, html..
  --         null_ls.builtins.formatting.clang_format, -- c, c++
  --         null_ls.builtins.diagnostics.eslint_d, -- js, html..
  --         null_ls.builtins.diagnostics.pylint,
  --         null_ls.builtins.completion.spell,
  --         null_ls.builtins.formatting.clang_format.with({
  --           extra_args = { "-style={BasedOnStyle: llvm, IndentWidth: 2, ColumnLimit: 100}" },
  --         }),
  --       },
  --     })
  --     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  --   end,
  -- },

  -- ui
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
      vim.cmd([[ highlight FloatBorder guibg=none
       highlight NormalFloat guibg=none
      ]])
    end,
  },

  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
    end,
  },

  {
    "rose-pine/neovim",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
  },

  {
    "vimwiki/vimwiki",
    init = function()
      vim.cmd([[
        filetype plugin on
        syntax on
        let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/docs',
                    \ 'syntax': 'markdown', 'ext': '.md'}]
        let g:vimwiki_path = '~/.config/nvim/vimwiki/docs'
        let g:vimwiki_markdown_link_ext = 1
        imap <C-space> <Plug>VimwikiTableNextCell
      ]])
    end,
  },

  {
    -- TODO make the goyo config in lua
    "junegunn/goyo.vim",
    key = {
      key("n", "<leader>z", ":Goyo<CR>", { silent = true }),
    },
    config = function()
      vim.cmd([[

        function! s:goyo_enter()
          if executable('tmux') && strlen($TMUX)
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
          endif
          set noshowmode
          set noshowcmd
          set scrolloff=999
          set wrap
          set linebreak
          set winbar=
          set fillchars=eob:\
        endfunction

        function! s:goyo_leave()
          if executable('tmux') && strlen($TMUX)
            silent !tmux set status on
            silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
          endif
          set showmode
          set showcmd
          set scrolloff=8
          set nowrap
          set nolinebreak
      # set winbar=lua get_winbar()
          set fillchars=eob:~
        endfunction

        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()

              ]])
    end,
  },
}, {
  -- Lazy config
  ui = {
    border = "rounded",
  },
})

-- [[ Configure Telescope ]]
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require("telescope.builtin").live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set(
  "n",
  "<leader>/",
  require("telescope.builtin").current_buffer_fuzzy_find,
  { desc = "[/] Fuzzily search in current buffer" }
)

key("n", "<leader>fgf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
key("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" }) -- TODO maybe delete
key("n", "<leader>fsh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
key("n", "<leader>fsw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
key("n", "<leader>fgg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
key("n", "<leader>fgG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
key("n", "<leader>fsd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
key("n", "<leader>fsr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
key("n", "<leader>ft", require("telescope.builtin").colorscheme, { desc = "Search [T]heme" })
key("n", "<leader>fr", require("telescope.builtin").registers, { desc = "Search [R]egisters" })
key("n", "<leader>fv", require("telescope.builtin").command_history, { desc = "[v]Search command history" })
key("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "Search [K]eymaps" })

-- [[ Configure Treesitter ]]
vim.defer_fn(function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "cpp",
      "go",
      "lua",
      "python",
      "rust",
      "tsx",
      "java",
      "javascript",
      "typescript",
      "vimdoc",
      "vim",
      "bash",
      "sql",
      "regex",
      "markdown",
      "php",
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
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        scope_incremental = "<c-s>",
        node_decremental = "<M-space>",
      },
    },
    textobjects = {
      select = {

        enable = true,

        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>S"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  })
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
    title = "info",
  })
  vim.diagnostic.config({
    float = { border = "rounded" },
  })

  require("lspconfig.ui.windows").default_options = {
    border = "single",
  }
end

-- document existing key chains
require("which-key").register({
  ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
  ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
  ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
  ["<leader>h"] = { name = "More git", _ = "which_key_ignore" },
  ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
  ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
  ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
})

-- mason-lspconfig requires that these setup functions are called in this order
require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
  clangd = {
    format = {
              style = "llvm",  -- You can adjust the style to your preference
              indentWidth = 4,  -- Set the desired indent width
              columnLimit = 100 -- Set the desired column limit
          }
  },
  -- gopls = {},
  pyright = {},
  -- rust_analyzer = {},
  tsserver = {},
  html = { filetypes = { "html", "twig", "hbs" } },
  cssls = {},
  tailwindcss = { filetypes = { "html", "js", "ts" } },
  emmet_ls = { "html", "typescriptreact", "javascriptreact", "css", "sass" },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },

  intelephense = {
    filetypes = {
      "php",
    },
  },
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    })
  end,
})

-- [[ Configure nvim-cmp ]]
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

---@diagnostic disable-next-line: missing-fields
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    { name = "path" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    format = require("lspkind").cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})

-- +-------------------------------+
-- |            Commands           |
-- +-------------------------------+

-- reopen file at the same line it was when closing
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
]])

-- Display message when recording
function Recording()
  if vim.fn.getreg("*") ~= "" then
    return "recording at " .. vim.fn.getreg("*")
  end
  return ""
end

vim.cmd([[
    autocmd BufNewFile *.sh exec "normal i#!/usr/bin/env bash\<Esc>"

    augroup MarkdownTitle
        autocmd!
        autocmd BufNewFile *.md lua SetMarkdownTitle()
    augroup END
]])

function SetMarkdownTitle()
    if vim.fn.expand('%:t') ~= '' then
        local filename = string.gsub(vim.fn.expand('%:t:r'), '_', ' ')
        local capitalized = string.gsub(filename, "%a", string.upper, 1)
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {'# ' .. capitalized})
        vim.cmd('normal! gg')
        vim.cmd('normal! zz')
    end
end

vim.cmd([[
    augroup MarkdownTitle
        autocmd!
        autocmd BufNewFile *.md lua SetMarkdownTitle()
    augroup END
]])

-- tweak colorscheme
vim.cmd([[
    autocmd ColorScheme * highlight StatusLine guibg=none
    autocmd ColorScheme * highlight StatusLineNC guibg=none
    autocmd ColorScheme * highlight CursorLine guibg=none
    autocmd ColorScheme * highlight Folded guibg=none
    autocmd ColorScheme * highlight FloatBorder guibg=none
    autocmd ColorScheme * highlight NormalFloat guibg=none

]])

-- abbrev
vim.cmd([[

    cabbrev fi !firefox index.html

    autocmd FileType javascript iabbrev clo console.log();jkhi
    autocmd FileType javascript iabbrev dcel document.createElement("");jkhhi
    autocmd FileType javascript iabbrev dceld document.createElement("div");

    iabbrev inem if __name__ == "__main__jkA:jko

    autocmd FileType c iabbrev pfd printf("%d\n", );jkhhi
    autocmd FileType c iabbrev pfs printf("%s\n", );jkhhi
    autocmd FileType c iabbrev pfc printf("%c\n", );jkhhi
]])

vim.cmd.colorscheme(color)
vim.cmd([[ highlight StatusLine guibg=none ]])
vim.cmd([[ highlight StatusLineNC guibg=none ]])
vim.cmd([[ highlight Folded guibg=none ]])
vim.cmd([[ highlight MatchParen guibg=none ]])

local function get_winbar()
  local devicon = require("nvim-web-devicons")

  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")

  local dir = vim.fn.expand("%:p:h")

  local split_dir = vim.split(dir, "/") -- break path into all directories
  dir = split_dir[#split_dir]          -- get last dir in the path

  local icon, icon_hl = devicon.get_icon(filename, extension, { default = true })
  local win_hl = "%#WinBar#"

  local branch = vim.fn.FugitiveStatusline()

  if branch ~= "" then
    branch = string.match(branch, "%((.*)%)")
    branch = "%#Green#  " .. win_hl .. branch
  end

  return "%#Directory#󰉋 "
      .. win_hl
      .. dir
      .. "%#Yellow#"
      .. " > "
      .. "%#"
      .. icon_hl
      .. "#"
      .. icon
      .. win_hl
      .. " "
      .. filename
      .. "%="
      .. (branch or "")
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.o.winbar = get_winbar()
  end,
})

vim.cmd([[

set foldtext=CustomFoldText()
  function! CustomFoldText()
      let indentation = indent(v:foldstart)
      let foldSize = 1 + v:foldend - v:foldstart
      let foldSizeStr = " " . foldSize . " lines "
      let foldLevelStr = repeat("+--", v:foldlevel)
      let expansionString = repeat(" ", indentation)

      return expansionString . "\ueb70" . foldSizeStr
  endfunction
]])
