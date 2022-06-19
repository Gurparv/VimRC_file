set rnu
set nu
set tabstop=4
set backspace=indent,eol,start
set nohls
set signcolumn=yes
set scrolloff=8
set incsearch
set wildmenu
set shiftwidth=4
set noswapfile
set cursorline
set splitright
set splitbelow
set clipboard+=unnamedplus
colorscheme gruvbox

"Open File Explorer - Intellij same
nmap <A-1> :30Lexplore<CR>

"Create new file - Intellij same
nmap <A-Insert> :tabe<CR>

"Close a file
nmap <A-x> :close<CR>

"For quick access to init.vim file
nmap <leader>init :tabe<SPACE>~/AppData/Local/nvim/init.vim<CR>

"Shourtcut to source the init file
nmap <leader>s :source %<CR>

"Switch tabs easily - Intellij same
nmap <A-Right> gt
nmap <A-Left> gT

"Save file easily
nmap <C-s> :w<CR>

"Better window navigations
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resizing windows using keys
nmap <C-Up> :resize<SPACE>+2<CR>
nmap <C-Down> :resize<SPACE>-2<CR>
nmap <C-Right> :vertical resize<SPACE>-2<CR>
nmap <C-Left> :vertical resize<SPACE>+2<CR>

"Mapping the Esc key
imap jk <ESC>

"Indenting and hold in Visual mode 
vmap < <gv
vmap > >gv

"Folding/collapsing methods


call plug#begin('~/AppData/Local/nvim/autoload/plugged')
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/sainnhe/everforest.git'
call plug#end()

"Plugins installed are Harpoon, SAlesforce apex highlighting, Telescope, 
