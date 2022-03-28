set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set nocompatible

" Lightline
let g:lightline = {
   \       'colorscheme': 'one'
   \   }
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
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


" NERDTree 
nmap <C-n> :NERDTreeToggle<CR>
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

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
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'
Plug 'yggdroot/indentline'

" Themes
Plug 'rakr/vim-two-firewatch'
Plug 'preservim/vim-colors-pencil'
Plug 'rakr/vim-one'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'

" Syntactic language support
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color'

" NERDTree icons (should be loaded as the very last one
Plug 'ryanoasis/vim-devicons'


call plug#end()



"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Enable theme
set background=light
let g:one_allow_italics = 1
colo pencil
