" General
set number		" Show line numbers
set relativenumber	" Show relative numbers line
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=500	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
syntax on		" Turn syntax highlighting on
set laststatus=2	"Always display the status bar
set clipboard=unnamedplus

set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
 
set autoindent		" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

filetype plugin indent on
filetype on		" Enable file type detection
set ttyfast		" Better performance
set nocompatible	" Disable VI compatibility
set clipboard=unnamedplus

" Shortcuts
nmap <C-w> :wq!<CR>		" Save & Quit file
nmap <C-q> :q!<CR>		" Quit file
nmap <C-s> :w!<CR>		" Save file
nnoremap("<C-u>", "<C-u>zz")	" Center the view & Go Top
nnoremap("<C-d>", "<C-d>zz")	" Center the view & Go Bottom
nnoremap <C-j> :tabprevious<CR> " Switch to previous tab
nnoremap <C-k> :tabnext<CR>	" Switch to next tab
nnoremap <C-t> :tabnew

" Color
" set termguicolors	" enable true colors support
if v:version < 802
    packadd! everforest
endif
syntax enable
set background=dark
colorscheme everforest


" Plugins

call plug#begin()

"NERDTREE Plugin
Plug 'scrooloose/nerdtree'
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fecha () {} [] automaticamente
Plug 'jiangmiao/auto-pairs'

call plug#end()


" Plugins Configurações
" " Toggle nerdtree
map <C-n> :NERDTreeToggle<CR>


" Tab para navegar nas sugestões
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Enter para confirmar sugestão
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" "
" COC
" Compila e roda o arquivo C atual com F5
autocmd FileType c nnoremap <F5> :w <bar> !gcc % -o %< && ./%< <CR>
autocmd FileType c nnoremap <F6> :w <bar> !bear -- gcc % -o %< -lraylib -lGL -lm -lpthread -ldl -lrt && ./%< <CR>
autocmd FileType c nnoremap <F7> :w <bar> !gcc % -o %< -lncurses -ltinfo && ./%< <CR>
