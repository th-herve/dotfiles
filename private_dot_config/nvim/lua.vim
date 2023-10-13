
" Treesitter
lua <<EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "sql", "regex", "bash", "markdown", "markdown_inline"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
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
},   
}
EOF


" Nvim tree 
" lua <<EOF

" vim.g.loaded_netrw = 1
" vim.g.loaded_netrwPlugin = 1

" require("nvim-tree").setup({
"   sort_by = "case_sensitive",
"   view = {
"     width = 30,
"   },
"   renderer = {
"     group_empty = true,
"     icons = {
"       show = {
"           git = false,
"           },
"       },
"   },

"   filters = {
"     dotfiles = true,
"   },
" })

" EOF

lua <<EOF

require('flash').setup({
  search = {
    mode = function(str) -- match only beginning of words
      return "\\<" .. str
    end,
  },
})

vim.keymap.set("n", "s", function() require("flash").jump() end)
vim.keymap.set("o", "s", function() require("flash").jump() end)
vim.keymap.set("x", "s", function() require("flash").jump() end)

-- vim.cmd[[highlight FlashLabel guifg=#a6da95 guibg=#24273a gui=bold]]
-- vim.cmd[[highlight FlashMatch guifg=#b7bdf8 guibg=#24273a]]


-- Devdocs
vim.defer_fn(function()
require('nvim-devdocs').setup({
 float_win = {
    relative = "editor",
    height = 40,
    width = 150,
    border = "rounded",
  },
})
end, 0)

vim.keymap.set("n", "<leader>dd", ":DevdocsOpenFloat<CR>")
vim.keymap.set("n", "<leader>dh", ":DevdocsOpenFloat html<CR>")
vim.keymap.set("n", "<leader>dc", ":DevdocsOpenFloat css<CR>")
vim.keymap.set("n", "<leader>dj", ":DevdocsOpenFloat javascript<CR>")

EOF
