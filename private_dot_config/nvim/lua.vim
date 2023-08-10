
" Treesitter
lua <<EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "regex","bash", "markdown", "markdown_inline"},

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
require("noice").setup({
     messages = {
        enabled = false,
      },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
      },
})

EOF
