"    _  _  ____  __  __  ____   ___ 
"   ( \/ )(_  _)(  \/  )(  _ \ / __)
"    \  /  _)(_  )    (  )   /( (__ 
"     \/  (____)(_/\/\_)(_)\_) \___)


" +-------------------------------+
" |       General settings        |
" +-------------------------------+

imap <Esc> <Nop>

set relativenumber number hidden nocompatible wrap splitright showmatch

set guicursor=n:hor25,i:ver20,c:ver20,v:block

set clipboard=unnamedplus

set scrolloff=8

set termguicolors  

"    === Status bar === 

set statusline=%=%l/%L 
set laststatus=2 
set noshowmode 
set winbar=%t


"       === Tab ===

set expandtab autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType css        setlocal shiftwidth=2 tabstop=2
autocmd FileType json       setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown   setlocal shiftwidth=2 tabstop=2
autocmd FileType text       setlocal shiftwidth=2 tabstop=2
autocmd FileType vimwiki    setlocal shiftwidth=2 tabstop=2

"       === Fold ===

set foldmethod=indent
set foldnestmax=4
set foldignore=
set foldtext=CustomFoldText()
set fillchars=fold:\ 
autocmd FileType html setlocal foldnestmax=8

"     === terminal ===

" function Empty()
"   return ""
" endfunction
" autocmd TermEnter * setlocal winbar=%{%Empty()%}

" autocmd TermEnter * setlocal nonumber norelativenumber

"      === Other ===

set spelllang=en_us
set spellsuggest+=10

set completeopt-=preview

set incsearch hlsearch
set ignorecase smartcase

set noswapfile
set nobackup

" +-------------------------------+
" |           Keybinds            |
" +-------------------------------+

nnoremap            <Space>         <Nop>
let mapleader = "\<Space>"


nnoremap <silent>   <leader>v       :vsplit<CR>

tnoremap <silent>   jk              <C-\><C-n>
" tnoremap <silent>   jkk             <C-\><C-n>:q!<CR>
" tnoremap <silent>   <Esc>           <C-\><C-n>
" tnoremap <silent>   <Esc><Esc>      <C-\><C-n>:q!<CR>
" nnoremap <silent>   <leader>t       :belowright split<CR>:terminal<CR>:horizontal resize 15<CR>i

nnoremap            <leader>e       <C-w>w

nnoremap            <leader>a       ggVG 
vnoremap            <leader>a       <Esc>

nnoremap <silent>   <leader>h       :if bufloaded(expand('~/.config/nvim/doc/keybind.md')) \| execute ':w' \| execute 'bwipeout! ~/.config/nvim/doc/keybind.md' \| else \| vsplit \| vertical resize 38 \| edit ~/.config/nvim/doc/keybind.md \| endif<CR>
nnoremap <silent>   <leader>wv      :if bufloaded(expand('~/.config/nvim/init.vim')) \| execute ':w' \| execute 'bwipeout! ~/.config/nvim/init.vim' \| else \| vsplit \| edit ~/.config/nvim/init.vim \| endif<CR>

nnoremap <silent>   <leader>z       :ZenMode<CR>

nnoremap <silent>   <C-S-J>           :m .+1<CR>==
nnoremap <silent>   <C-S-k>           :m .-2<CR>==
inoremap <silent>   <C-j>           <Esc>:m .+1<CR>==gi
inoremap <silent>   <C-k>           <Esc>:m .-2<CR>==gi
vnoremap <silent>   <C-j>           :m '>+1<CR>gv=gv
vnoremap <silent>   <C-k>           :m '<-2<CR>gv=gv


" NvimTree
" noremap             <Leader>b       :NvimTreeToggle<CR>
" nnoremap            <C-b>           :NvimTreeToggle<CR>

" file navigation/operation
nnoremap <silent>   <M-l>           :bnext<CR>
nnoremap <silent>   <M-h>           :bprevious<CR>
nnoremap <silent>   <leader>s       :w<CR>
nnoremap <silent>   <leader>q       :w<CR>:bd<CR>

noremap             <A-j>           <C-e>  
noremap             <A-k>           <C-y>

nmap                <M-v>           <C-v>

nnoremap <silent>   <leader>cc      :nohlsearch<CR> <Esc>

map      <silent>   <leader>o       :setlocal spell!<CR>

" reselect indentation
vnoremap            <               <gv
vnoremap            >               >gv

nnoremap            <C-d>           <C-d>zz
nnoremap            <C-u>           <C-u>zz
nnoremap            n               nzzzv
nnoremap            N               nzzzv 

nnoremap <silent>   <leader>u       :UndotreeToggle<CR>

" nnoremap            <leader>l       :ls<CR>:b <Space>

nnoremap            <leader>;       A;<Esc>
nnoremap            <leader>.       A.<Esc>
nnoremap            <leader>,       A,<Esc>
nnoremap            <leader>:       A:<Esc>
nnoremap            <leader>>       A>

nnoremap            <leader><Space> za

inoremap            jk              <Esc>
vnoremap            hj              <Esc>
cnoremap            jk              <Esc>
" nnoremap hj <Esc> 

nnoremap            <M-d>           <C-d>zz
nnoremap            <M-u>           <C-u>zz

nnoremap <silent>   <leader>cl      :ColorizerToggle<CR>

" Git fugitive
nnoremap            <leader>gs      :Git status<CR>
nnoremap            <leader>ga.     :Git add .<CR>
nnoremap            <leader>gaw     :Gw<CR>
nnoremap            <leader>gcm     :Git commit -m "
nnoremap            <leader>gp      :Git push

cnoremap            <C-b>           <Left>
cnoremap            <C-f>           <Right>
cnoremap            <M-b>           <c-left>
cnoremap            <M-f>           <c-right>
cnoremap            <C-a>           <Home>
cnoremap            <C-e>           <End>

inoremap            <C-b>           <Left>
inoremap            <C-f>           <Right>
inoremap            <M-b>           <c-left>
inoremap            <M-f>           <c-right>
inoremap            <C-a>           <Home>
inoremap            <C-e>           <End>

nmap                L               $
nmap                H               ^
omap                L               $
omap                H               ^
vmap                L               $
vmap                H               ^

nnoremap            <C-I>           <C-O>
nnoremap            <C-O>           <C-I>

" +-------------------------------+
" |           Plugins             |
" +-------------------------------+

call plug#begin('~/.config/nvim/plugged')

    Plug 'folke/zen-mode.nvim',
    Plug 'tpope/vim-surround',
    Plug 'tpope/vim-commentary',
    Plug 'mg979/vim-visual-multi', {'branch': 'master'},
    Plug 'vimwiki/vimwiki',
    Plug 'ellisonleao/glow.nvim',
    Plug 'tpope/vim-fugitive',
    " Plug 'yamatsum/nvim-cursorline',
    " Plug 'itchyny/vim-cursorword',
    Plug 'jiangmiao/auto-pairs',
    Plug 'norcalli/nvim-colorizer.lua',

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'},
    Plug 'nvim-treesitter/playground',

    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' },
    Plug 'nvim-lua/plenary.nvim',
    Plug 'nvim-tree/nvim-web-devicons',

    Plug 'mbbill/undotree',

    Plug 'KabbAmine/vCoolor.vim',

    Plug 'mattn/emmet-vim',
    Plug 'tpope/vim-repeat',

    Plug 'dense-analysis/ale',

    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'},

    Plug 'stevearc/oil.nvim',
    Plug 'ThePrimeagen/harpoon',

    Plug 'folke/flash.nvim',

    Plug 'luckasRanarison/nvim-devdocs',

      " LSP Support

"         == themes ==
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' },
    Plug 'Mofiqul/dracula.nvim',
    Plug 'rose-pine/neovim',
    Plug 'joshdick/onedark.vim',
    Plug 'nordtheme/vim',
    Plug 'rebelot/kanagawa.nvim',
    Plug 'sainnhe/everforest',
    Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' },
    Plug 'ellisonleao/gruvbox.nvim' ,

" completion
  Plug 'hrsh7th/nvim-cmp' ,
  Plug 'hrsh7th/cmp-buffer' ,
  Plug 'hrsh7th/cmp-path' ,
  Plug 'hrsh7th/cmp-cmdline' ,
  Plug 'saadparwaiz1/cmp_luasnip' ,
  Plug 'hrsh7th/cmp-nvim-lsp',

" snippet
  Plug 'L3MON4D3/LuaSnip' ,
  Plug 'rafamadriz/friendly-snippets' ,

" lsp
  Plug 'neovim/nvim-lspconfig' ,
  Plug 'williamboman/mason.nvim' ,
  Plug 'williamboman/mason-lspconfig.nvim' ,
  Plug 'jose-elias-alvarez/null-ls.nvim',
  Plug 'jayp0521/mason-null-ls.nvim',
  Plug 'glepnir/lspsaga.nvim',
  Plug 'onsails/lspkind.nvim',

call plug#end()



source   ~/.config/nvim/lua.vim
source   ~/.config/nvim/ale-linting.vim

source   ~/.config/nvim/cmp.vim
source   ~/.config/nvim/lsp.vim

lua require'colorizer'.setup()


"        === Vimwiki ===

filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/docs', 
            \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_path = '~/.config/nvim/vimwiki/docs'
let g:vimwiki_markdown_link_ext = 1
imap <C-space> <Plug>VimwikiTableNextCell

"        === Undotree ===

set undodir=/home/adiantum/.undodir_combined
set undofile
set undolevels=100000
let g:undotree_SetFocusWhenToggle = 1

"        === Cursor line/word ===

set cursorline
highlight CursorLine ctermbg=none
highlight CursorLineNr ctermfg=yellow

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

let g:cursorword_delay=900

let g:vcool_ins_hsl_map = '<C-]>'		" Insert hsl color with vcolor

"        === Emmet ===

let g:user_emmet_leader_key='<M-,>'

"        === Telescope ===

lua require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 

nnoremap            <leader>ff      <cmd>Telescope find_files<cr>
nnoremap            <leader>fg      <cmd>Telescope live_grep<cr>
nnoremap            <leader>fb      <cmd>Telescope buffers<cr>
nnoremap            <leader>fh      <cmd>Telescope help_tags<cr>
nnoremap            <leader>fc      <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap            <leader>ft      <cmd>Telescope colorscheme<cr>
nnoremap            <leader>fr      <cmd>Telescope registers<cr>
nnoremap            <leader>fv      <cmd>Telescope command_history<cr>
nnoremap            <leader>fs      <cmd>Telescope search_history<cr>
nnoremap            <leader>fk      <cmd>Telescope keymaps<cr>


"        === Surround ===

nmap yww ysiw"

"        === Auto-pairs ===

let g:AutoPairsShortcutBackInsert = ''

"        === Toggle term ===

lua require("toggleterm").setup({open_mapping = [[<c-/>]],shade_terminals = true, direction = "float",float_opts = {border = 'single' }, highlight = { Normal = { guibg = '#11111b', } }})

" Add another bind for st terminal (in st C-_ = C-/ for some reasons)
nnoremap <silent> <C-_> :ToggleTerm<CR>

"        === Oil ===

lua require("oil").setup({ keymaps = {["<BS>"] = "actions.parent"} })

nnoremap <silent> <leader>b :Oil --float<Cr>
nnoremap <silent> <C-b> :Oil<Cr>

"        === Harpoon ===

nnoremap <silent> <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent> <C-p> :lua require("harpoon.mark").add_file()<CR>

nnoremap <silent> <M-a> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <M-s> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <M-f> :lua require("harpoon.ui").nav_file(3)<CR>

" +-------------------------------+
" |         Color scheme          |
" +-------------------------------+

let g:everforest_background = 'hard'
colorscheme everforest
    highlight StatusLine guibg=none
    highlight StatusLineNC guibg=none
    highlight CursorLine guibg=none
    highlight Folded guibg=none
    highlight MatchParen guibg=none

" +-------------------------------+
" |           Function            |
" +-------------------------------+


function! Recording()
  if v:register != '*'
    return 'recording at ' . v:register
  endif
  return ''
endfunction

" remove auto comment at newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType vim highlight Comment ctermfg=green
" autocmd ColorScheme * highlight Normal guibg=none
" autocmd ColorScheme * highlight NormalNC guibg=none
autocmd ColorScheme * highlight StatusLine guibg=none
autocmd ColorScheme * highlight StatusLineNC guibg=none
autocmd ColorScheme * highlight CursorLine guibg=none
autocmd ColorScheme * highlight Folded guibg=none

function! CustomFoldText()
    let indentation = indent(v:foldstart)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let expansionString = repeat(" ", indentation)

    return expansionString . "\ueb70" . foldSizeStr
endfunction


" make it reopen file at the same line it was closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif  
endif

autocmd BufNewFile *.sh exec "normal i#!/usr/bin/env bash\<Esc>"

" +-------------------------------+
" |         Abbreviations         |
" +-------------------------------+

iabbrev inem if __name__ == "__main__jkA:jko

cabbrev snvi source ~/.config/nvim/init.vim

" Git fugitive
cabbrev gs Git status
cabbrev ga Git add 
cabbrev gcm Git commit -m "
cabbrev gp Git push
cabbrev gw Gw

cabbrev fi !firefox index.html
     
autocmd FileType sh iabbrev #!! #!/usr/bin/env bash

autocmd FileType javascript iabbrev clo console.log();jkhi
autocmd FileType javascript iabbrev dcel document.createElement("");jkhhi
autocmd FileType javascript iabbrev dceld document.createElement("div");
