" PLUGINS ---------------------------------------------------------------- {{{


" Plugin code goes here.
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

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

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Colours

" Molokai
"colo molokai
"let g:molokai_original = 1

" Important!!
        if has('termguicolors')
          set termguicolors
        endif
 
       " The configuration options should be placed before `colorscheme sonokai`.
        let g:sonokai_style = 'shusia'
        let g:sonokai_enable_italic = 0
        let g:sonokai_disable_italic_comment = 1
        colorscheme sonokai

" }}}
