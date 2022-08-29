set nocompatible
set mouse=a
" let mapleader=","

" ================================================================
" vim-plug plugins
" ================================================================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" ================================================================
" ================================================================

syntax on 
set number
set ruler
set bg=dark

" OSX stupid backspace fix
set backspace=indent,eol,start

" colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Enable folding
set foldmethod=syntax

" Cursor based on Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Set lightline theme
" let g:lightline = {}
" let g:lightline.colorscheme = 'gruvbox'

" ================================================================
" coc.nvim autocomplete keymaps
" ================================================================
" Close popup by <Space>.
" inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" ================================================================
" ================================================================


" ================================================================
" NERDTREE configs
" ================================================================
" keymaps
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
