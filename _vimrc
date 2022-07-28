set rnu
set nu
set tabstop=4
set backspace=indent,eol,start
set nohls
set nowrap
set signcolumn=yes
set scrolloff=8
set smartindent
set incsearch
set wildmenu
set shiftwidth=4
set noswapfile
set cursorline
set cursorcolumn
set ignorecase
set list
set splitright
set splitbelow
set clipboard+=unnamedplus
set laststatus=3
highlight WinSeparator guibg=None
colorscheme gruvbox

"Open File Explorer - Intellij same
nmap <A-1> :30Vexplore<CR>

"Create new file - Intellij same
nmap <A-Insert> :tabe<CR>

"Close a file
nmap <A-x> :close<CR>

"For quick access to init.vim file
nmap <leader>init :tabe<SPACE>~/AppData/Local/nvim/init.vim<CR>

"Shourtcut to source the init file
nmap <leader>s :source %<CR>

"Switch tabs easily - Intellij same
nmap <A-k> gt
nmap <A-j> gT

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

"Moving text up and down
vmap <A-j> :m '<-2<CR>gv=gv
vmap <A-k> :m '>+1<CR>gv=gv

"Save and Quite File
nnoremap <SPACE><SPACE>x :wq<CR>

"Remap <Space> key as leader
nnoremap <SPACE> <NOP>
let mapleader = " "


"Recognize .apex and .cls files as Salesforce apex files
au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apexcode


call plug#begin('~/AppData/Local/nvim/autoload/plugged')
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/sainnhe/everforest.git'
Plug 'https://github.com/neovim/nvim-lspconfig.git'
Plug 'https://github.com/williamboman/nvim-lsp-installer.git'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag':'0.1.0'}

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
call plug#end()



			
lua <<EOF
require("nvim-lsp-installer").setup {
	automatic_installation = true,
	print("Boss -> LSP-installer instantiated !! ")
	}

require'lspconfig'.gopls.setup{
	on_attach = function() 
	print("Go LSP 'gopls' is attached to this buffer ✔✔😃") 
	vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
	vim.keymap.set("n","gd",vim.lsp.buf.definition,{buffer=0})
	vim.keymap.set("n","gt",vim.lsp.buf.type_definition,{buffer=0})
	vim.keymap.set("n","gi",vim.lsp.buf.implementation,{buffer=0})
	vim.keymap.set("n","<leader>df",vim.diagnostic.goto_next,{buffer=0})
	vim.keymap.set("n","<leader>dp",vim.diagnostic.goto_prev,{buffer=0})
	vim.keymap.set("n","<leader>dl","<cmd> Telescope diagnostics<CR>",{buffer=0})
	vim.keymap.set("n","<leader>r",vim.lsp.buf.rename,{buffer=0})
	end,
    flags = lsp_flags,
}

require'lspconfig'.pyright.setup{
	on_attach = function()
	print("Python LSP - 'pyright' is attached to this buffer .. Woohoo! 😘")
	end,
    flags = lsp_flags,
}

require'lspconfig'.sumneko_lua.setup{
	on_attach = function()
	print("Lua LSP - 'sumneko_lua' is attached ! 🎉🤩")
	end,
    flags = lsp_flags,
}

require'lspconfig'.jdtls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})


require'lspconfig'.quick_lint_js.setup({
	on_attach = function() 
	print("Javascript LSP - 'quick_lint_js' is attached ! 😁❤")
	vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
	end,
	flags = lsp_flags,
})

EOF

