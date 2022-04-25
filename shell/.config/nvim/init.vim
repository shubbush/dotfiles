set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set nocompatible

" Lightline
let g:lightline = {
   \       'colorscheme': 'one'
   \   }
" Turn on syntax highlighting.
syntax on
" Show line numbers.
set number
set relativenumber
set number " Also show current absolute line
set laststatus=2

set backspace=indent,eol,start
set ignorecase
set smartcase

set autoindent
set encoding=utf-8
set scrolloff=2
set signcolumn=yes

set noshowmode



" =============================================================================
" # MAPPINGS
" =============================================================================
" Jump to start and end of line using the home row keys
map H ^
map L $

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set mouse+=a
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" copy to system clypboard by default 
set clipboard=unnamedplus



" =============================================================================
" # PLUGINS
" =============================================================================
call plug#begin()
" Load plugins
" VIM enhancements
Plug 'justinmk/vim-sneak'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'kshenoy/vim-signature'
Plug 'yggdroot/indentline'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Themes
Plug 'shaunsingh/solarized.nvim'
Plug 'projekt0n/github-nvim-theme'

" Git
Plug 'airblade/vim-gitgutter'

" Syntactic language support
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'

" NERDTree icons (should be loaded as the very last one
Plug 'ryanoasis/vim-devicons'


call plug#end()

" NvimTree 
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
set termguicolors
lua << EOF
  require'nvim-tree'.setup()
EOF

" Enable theme
set background=light
let g:one_allow_italics = 1
colors github_light 

" Plugin settings
"
" vim_markdown
"disable concealing in markdown
let g:vim_markdown_conceal = 0 
let g:vim_markdown_conceal_code_blocks = 0
