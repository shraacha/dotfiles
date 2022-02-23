" PLUGINS ---------------------------------------------------------------- {{{


" Plugin code goes here.
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/autoload/plugged')

" Declare the list of plugins.

" Racket REPL
Plug 'Olical/conjure'

" Racket auto-detection, indentation, and syntax highlighting
Plug 'wlangstroth/vim-racket'

" Autocomplete 'n more
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tree view
Plug 'preservim/nerdtree'

" Airline statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'


" Themes:
" Paper theme
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
" Monokai pro alternative theme
Plug 'sainnhe/sonokai'

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

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
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

" }}}


" MISC ------------------------------------------------------------------ {{{


set nocompatible                              " Disable compatibility with vi which can cause unexpected issues.

filetype on                                   " Enable type file detection. Vim will be able to try to detect the type of file in use.

filetype plugin on                            " Enable plugins and load plugin for the detected file type.

filetype indent on                            " Load an indent file for the detected file type.

syntax on                                     " Turn syntax highlighting on.

set number relativenumber                     " Add numbers to each line on the left-hand side.

set cursorline                                " Highlight cursor line underneath the cursor horizontally.

set cursorcolumn                              " Highlight cursor line underneath the cursor vertically.

set cursorline                                " Highlight cursor line underneath the cursor horizontally.

set cursorcolumn                              " Highlight cursor line underneath the cursor vertically.

set title                                     " Show file title

set wildmenu                                  " Show a more advance menu
  
set expandtab                                 " No tabs! 

set splitbelow                                " Split below
" }}}


" COLOURS ------------------------------------------------------------------ {{{

" Molokai
"colo molokai
"let g:molokai_original = 1

" Important!!
        if has('termguicolors')
          set termguicolors
        endif
 
       " The configuration options should be placed before `colorscheme sonokai`.
        let g:sonokai_style = 'andromeda'
        let g:sonokai_enable_italic = 0
        let g:sonokai_disable_italic_comment = 1
        let g:airline_theme = 'sonokai'
        colorscheme sonokai

" }}}
