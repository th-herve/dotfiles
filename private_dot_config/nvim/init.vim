"    _  _  ____  __  __  ____   ___ 
"   ( \/ )(_  _)(  \/  )(  _ \ / __)
"    \  /  _)(_  )    (  )   /( (__ 
"     \/  (____)(_/\/\_)(_)\_) \___)


" +-------------------------------+
" |       General settings        |
" +-------------------------------+

imap <Esc> <Nop>

set relativenumber number hidden nocompatible nowrap splitright showmatch

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
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2


"     === Terminal ===

" set shell=powershell.exe
" let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
" let &shellquote   = ''
" let &shellpipe    = '| Out-File -Encoding UTF8 %s'
" let &shellredir   = '| Out-File -Encoding UTF8 %s'

"       === Fold ===

set foldmethod=indent
set foldnestmax=1
set foldignore=
set foldtext=CustomFoldText()
set fillchars=fold:\ 

"      === Other ===

set spelllang=en_us
set spellsuggest+=10

set completeopt-=preview

set incsearch hlsearch
set ignorecase smartcase

set noswapfile
set nobackup

" let g:netrw_liststyle = 3
" let g:netrw_banner = 0

" +-------------------------------+
" |           Keybinds            |
" +-------------------------------+

nnoremap <Space> <Nop>
let mapleader = "\<Space>"


nnoremap <leader>v :vsplit<CR>

tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <Esc><Esc> <C-\><C-n>:q!<CR>
nnoremap <silent> <leader>t :vsplit<CR>:terminal bash<CR>:vertical resize 50<CR>i <C-l>

nnoremap <leader>e <C-w>

nnoremap <leader>a ggVG 
vnoremap <leader>a <Esc>

nnoremap <silent> <leader>h :if bufloaded(expand('~/.config/nvim/doc/keybind.md')) \| execute ':w' \| execute 'bwipeout! ~/.config/nvim/doc/keybind.md' \| else \| vsplit \| vertical resize 38 \| edit ~/.config/nvim/doc/keybind.md \| endif<CR>
nnoremap <silent> <leader>wv :if bufloaded(expand('~/.config/nvim/init.vim')) \| execute ':w' \| execute 'bwipeout! ~/.config/nvim/init.vim' \| else \| vsplit \| edit ~/.config/nvim/init.vim \| endif<CR>

nnoremap <silent> <leader>z :ZenMode<CR>

nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" NvimTree
noremap <Leader>b :NvimTreeToggle<CR>
inoremap <C-b> :NvimTreeToggle<CR>
nnoremap <C-b> :NvimTreeToggle<CR>

" file navigation/operation
nnoremap <silent> <M-l> :bnext<CR>
nnoremap <silent> <M-h> :bprevious<CR>
nnoremap <silent> <leader>s :w<CR>
nnoremap <silent> <leader>q :w<CR>:bd<CR>

noremap <A-j> <C-e>  
noremap <A-k> <C-y>

nmap <M-v> <C-v>

nnoremap <silent> <leader>cc :nohlsearch<CR> <Esc>

map <silent> <leader>o :setlocal spell!<CR>

" reselect indentation
vnoremap < <gv
vnoremap > >gv

" Map Tab key to trigger completion with coc.vim
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N nzzzv 

nnoremap <silent> <leader>u :UndotreeToggle<CR>

nnoremap <leader>l :ls<CR>:b <Space>

nnoremap <leader>; A;<Esc>
nnoremap <leader>. A.<Esc>
nnoremap <leader>, A,<Esc>
nnoremap <leader>: A:<Esc>
nnoremap <leader>> A><Esc>

nnoremap <leader><Space> za

inoremap jk <Esc>
vnoremap hj <Esc>
cnoremap jk <Esc>
" nnoremap hj <Esc> 

nnoremap <M-d> <C-d>zz
nnoremap <M-u> <C-u>zz

nnoremap ' m
nnoremap m '

nnoremap <silent> <leader>cl :ColorizerToggle<CR>

" Git fugitive

nnoremap <leader>gs :Git status<CR>
nnoremap <leader>ga. :Git add .<CR>
nnoremap <leader>gcm :Git commit -m "
nnoremap <leader>gp :Git push

" +-------------------------------+
" |           Plugins             |
" +-------------------------------+


call plug#begin('~/.config/nvim/plugged')

    Plug 'neoclide/coc.nvim', 
    Plug 'folke/zen-mode.nvim',
    Plug 'tpope/vim-surround',
    Plug 'tpope/vim-commentary',
    Plug 'mg979/vim-visual-multi', {'branch': 'master'},
    Plug 'vimwiki/vimwiki',
    Plug 'ellisonleao/glow.nvim',
    Plug 'tpope/vim-fugitive',
    Plug 'yamatsum/nvim-cursorline',
    Plug 'itchyny/vim-cursorword',
    Plug 'jiangmiao/auto-pairs',
    Plug 'norcalli/nvim-colorizer.lua',

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'},
    Plug 'nvim-treesitter/playground',

    Plug 'nvim-lua/plenary.nvim',
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' },

    Plug 'mbbill/undotree',

    Plug 'nvim-tree/nvim-web-devicons',
    Plug 'nvim-tree/nvim-tree.lua',

    " Plug 'ziontee113/color-picker.nvim',
    Plug 'KabbAmine/vCoolor.vim',

"         == themes ==
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' },
    Plug 'Mofiqul/dracula.nvim',
    Plug 'rose-pine/neovim',
    Plug 'joshdick/onedark.vim',
    Plug 'nordtheme/vim',
    Plug 'rebelot/kanagawa.nvim',
    
call plug#end()


lua require'colorizer'.setup()
source   ~/.config/nvim/lua.vim

" lua require('color-picker').setup()


"        === Vimwiki ===

filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/docs', 
            \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_path = '~/.config/nvim/vimwiki/docs'
let g:vimwiki_markdown_link_ext = 1
" let g:vimwiki_auto_fold = 1

"        === Undotree ===

set undodir=/home/adiantum/.undodir_combined
set undofile
set undolevels=100000
let g:undotree_SetFocusWhenToggle = 1

"        === Coc.nvim ===

let g:coc_global_extensions = ['coc-pyright',"coc-html", "coc-css","coc-tsserver","coc-clangd"]
let g:coc_suggest_enable = 1
let g:coc_suggest_triggerAfterInsertEnter = 0
let g:coc_suggest_autoTrigger = 'always'
let g:coc_suggest_enablePreview = 1
let g:coc_suggest_insertMode = 'inline'
let g:coc_suggest_insertCompletion = 'always'
let g:coc_suggest_selectNextOnEnter = 0
let g:coc_suggest_acceptSuggestionOnCommitCharacter = 0


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

let g:vcool_ins_hsl_map = '<C-l>'		" Insert hsl color with vcolor

" +-------------------------------+
" |         Color scheme          |
" +-------------------------------+


colorscheme catppuccin-macchiato
    highlight StatusLine guibg=none
    highlight StatusLineNC guibg=none
    highlight CursorLine guibg=none
    highlight Folded guibg=none
    highlight MatchParen guibg=none

"         === NvimTree ===

highlight NvimTreeNormal guibg=none
highlight NvimTreeWinSeparator guifg=#181926

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

autocmd ColorScheme * highlight Normal guibg=none
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

" +-------------------------------+
" |         Abbreviations         |
" +-------------------------------+

iabbrev inem if __name__ == "__main__jkA:jko

cabbrev snvi source ~/.config/nvim/init.vim
