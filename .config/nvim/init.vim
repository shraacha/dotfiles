" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/autoload/plugged')

" Misc:
Plug 'wlangstroth/vim-racket'                   " Racket auto-detection, indentation, and syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete 'n more (Use release branch (recommended) )
Plug 'preservim/nerdtree'                       " Tree view
Plug 'vim-airline/vim-airline'                  " Airline statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'                     " Better Syntax Support
Plug 'lervag/vimtex'                            " vimtex
" Plug 'github/copilot.vim'                      copilot

" Themes:
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git' " Paper theme
"Plug 'sainnhe/sonokai'                                Monokai pro alternative theme
Plug 'sainnhe/edge'                                   " Edge theme
Plug 'folke/tokyonight.nvim'                          " Tokyonight theme

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" }}}
" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.
" NERDTree remaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" resize window CTRL+(h|j|k|l)
nnoremap <C-j> :resize +1<CR>
nnoremap <C-k> :resize -1<CR>
nnoremap <C-h> :vertical resize -1<CR>
nnoremap <C-l> :vertical resize +1<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" doom inspired
nmap <leader> hr <Plug>(coc-rename)

" }}}
" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.colnr = ' :'
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ' :'
  let g:airline_symbols.maxlinenr = '☰ '
  let g:airline_symbols.dirty='⚡'

:command Light :set background=light | :AirlineTheme edge
:command Dark :set background=dark | :AirlineTheme edge

" }}}
" MISC ------------------------------------------------------------------ {{{
set nocompatible             " Disable compatibility with vi which can cause unexpected issues.
filetype on                  " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on           " Enable plugins and load plugin for the detected file type.
filetype indent on           " Load an indent file for the detected file type.
syntax on                    " Turn syntax highlighting on.
set number relativenumber    " Add numbers to each line on the left-hand side.
set cursorline               " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn             " Highlight cursor line underneath the cursor vertically.
set title                    " Show file title
set wildmenu                 " Show a more advance menu
set expandtab                " No tabs! 
set splitbelow               " Split below
set mouse=a                  " enable mouse

" }}}
" COLOURS ------------------------------------------------------------------ {{{

" Molokai
"colo molokai
"let g:molokai_original = 1

"let g:tokyonight_style = 'storm'
"colorscheme tokyonight

"edge theme, the daily
" Important!!
        if has('termguicolors')
          set termguicolors
        endif

        " The configuration options should be placed before `colorscheme edge`.
        let g:edge_style = 'neon'
        let g:edge_enable_italic = 1
        let g:edge_disable_italic_comment = 0
        let g:airline_theme = 'edge'
        colorscheme edge


" sonokai theme
        " The configuration options should be placed before `colorscheme sonokai`.
"        let g:sonokai_style = 'andromeda'
"        let g:sonokai_enable_italic = 0
"        let g:sonokai_disable_italic_comment = 1
"        let g:airline_theme = 'sonokai'
"        colorscheme sonokai

" }}}
