"  ███              ███   █████                    ███                 
" ▒▒▒              ▒▒▒   ▒▒███                    ▒▒▒                  
" ████  ████████   ████  ███████      █████ █████ ████  █████████████  
"▒▒███ ▒▒███▒▒███ ▒▒███ ▒▒▒███▒      ▒▒███ ▒▒███ ▒▒███ ▒▒███▒▒███▒▒███ 
" ▒███  ▒███ ▒███  ▒███   ▒███        ▒███  ▒███  ▒███  ▒███ ▒███ ▒███ 
" ▒███  ▒███ ▒███  ▒███   ▒███ ███    ▒▒███ ███   ▒███  ▒███ ▒███ ▒███ 
" █████ ████ █████ █████  ▒▒█████  ██  ▒▒█████    █████ █████▒███ █████
"▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒    ▒▒▒▒▒  ▒▒    ▒▒▒▒▒    ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ 

"{{{ General Settings
set nocompatible
syntax enable             " Enable syntax highlighting
set encoding=utf-8        " Display encoding
set fileencoding=utf-8    " File encoding
                          " Hybrid line numbers:
set number                " Show global line number for current line
set relativenumber        " Show relative numbers for everything else
set cmdheight=2           " More room for commands to display
set showtabline=2         " Always show tabs
set clipboard=unnamedplus " Yanks and puts from clipboard
set noshowmode            " Hide --INSERT--, light line handles it
set mouse=a               " It is 2020, enable the mouse
set cursorline            " Highlight the current row

"General tab things
set tabstop=2             " A tab is 2 spaces
set shiftwidth=2          " Auto indent should use 2 spaces
set expandtab             " Replace tabs with spaces
set smartindent           " Automatic indenting, see allso 'cindent'

"Folds
set foldenable
set foldmethod=syntax

set autochdir             " Set the working directory to the file being edited
set t_Co=256              " Support 256 colors
colorscheme seoul256
"}}}
"{{{ Which Key Settings
let g:which_key_sep = '>=>'             " Seperates the key bind and description
let g:which_key_use_floating_win = 0    " Floating window looked weird to me
let timeoutlen=500                      " How quickly to display whichkey

" Not realy sure, author suggests it
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"}}}
"{{{ Lightline Settings

" On inactive windows display the window number
let g:lightline = {
      \ 'inactive' : {
        \ 'left' : [ ['filename', 'winnr' ] ]
        \},
      \}
"}}}
"{{{ Startify Settings
" Turns out this is default location
"let g:startify_session_dir = '~/.local/share/nvim/session'
let g:startify_session_delete_buffers = 1 " Delete all buffers when loading or
                                          " closing a session
let g:startify_fortune_use_unicode = 1    " Its 2020, use unicode

let g:ascii = [
      \'_________________________________________       ',
      \' ________________/\\\_____________________      ',
      \'  __/\\\____/\\\_\///_____/\\\\\__/\\\\\___     ',
      \'   _\//\\\__/\\\___/\\\__/\\\///\\\\\///\\\_    ',
      \'    __\//\\\/\\\___\/\\\_\/\\\_\//\\\__\/\\\_   ',
      \'     ___\//\\\\\____\/\\\_\/\\\__\/\\\__\/\\\_  ',
      \'      ____\//\\\_____\/\\\_\/\\\__\/\\\__\/\\\_ ',
      \'       _____\///______\///__\///___\///___\///__',
      \'',
      \]
let g:startify_custom_header = 
      \ 'g:ascii + startify#fortune#boxed()'
set sessionoptions=blank,curdir,folds,help,tabpages,winpos
"}}}
"{{{ Vim Wiki
let wiki = {}
let wiki.path = '~/Wiki/'
let g:vimwiki_list = [ wiki ]
"}}}
"{{{ Key bindings
" Keybindings
"source $HOME/.config/nvim/keys/mappings.vim
let mapleader=" " " Space as a leader key
nnoremap <Space> <Nop> 

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}

" Bind <leader># to switch window
nnoremap <leader>1 :1wincmd w<CR>
nnoremap <leader>2 :2wincmd w<CR>
nnoremap <leader>3 :3wincmd w<CR>
nnoremap <leader>4 :4wincmd w<CR>
nnoremap <leader>5 :5wincmd w<CR>

" Don't clutter the menu with this information
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'

let g:which_key_map['#'] = ['', 'window-#']
let g:which_key_map['z'] = [':Goyo', 'tranquility']




let g:which_key_map.c = {
      \ "name" : '+config',
      \ "e"    : [':edit $MYVIMRC', 'edit config'],
      \ "r"    : [':source $MYVIMRC', 'reload config'],
      \}

let g:which_key_map.b = {
      \ "name" : '+buffer',
      \ "b" : [':ls', 'list buffers'],
      \ "h" : ['Startify', 'home'],
      \ "d" : [':bp|bd#', 'delete'],
      \ }

let g:which_key_map.w = {
      \ "name" : '+window',
      \ "/" : ['vsplit', 'vertical split'],
      \ "-" : ['split', 'horizontal split'],
      \ "d" : ['close', 'delete window'],
      \}

let g:which_key_map.s = {
      \ "name" : '+sessions',
      \ "s" : [':SSave', 'save'],
      \ "d" : [':SDelete', 'delete'],
      \ "l" : [':SLoad', 'load'],
      \}

let g:which_key_map.d = {
      \ "name" : '+diary',
      \ "t"    : [':VimwikiMakeDiaryNote', 'today'],
      \ "i"    : [':VimwikiDiaryIndex', 'index'],
      \ "r"    : ['VimwikiDiaryGenerateLinks', 'generate index'],
      \}



" Register which key map
autocmd VimEnter * call which_key#register('<Space>', "g:which_key_map")
"}}}

" vim:foldmethod=marker:foldlevel=0
