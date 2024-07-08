return {
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
}
