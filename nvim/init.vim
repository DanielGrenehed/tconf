set number
set relativenumber
set colorcolumn=80

let g:python3_host_prog = '/usr/local/bin/python3'
" Use custom theme 
colorscheme sunbather

call plug#begin()
Plug 'navarasu/onedark.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" FZF useful commands, open relative file browser with F12
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vista file navigation plugin, toggle with F11
Plug 'liuchengxu/vista.vim'

" CoC plugin, more useful commands and plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
:lua require("nvim-web-devicons")
:lua require("nvim-tree").setup()

nnoremap <silent> <F12> :NvimTreeToggle<CR>
nnoremap <silent> <F24> :Vista!!<CR>

nnoremap <silent> <F6> :tabnew<CR>
nnoremap <silent> <F18> :vsplit<CR>
nnoremap <silent> <S-Del> :q<CR>

nnoremap <silent> <F1> :Files<CR>
nnoremap <silent> <F13> :GFiles<CR>

nnoremap <silent> ¶ :wincmd h<CR>
nnoremap <silent> ŧ :wincmd l<CR>
nnoremap <silent> đ :wincmd k<CR>
nnoremap <silent> ß :wincmd j<CR>

let g:onedark_config = {'style':'deep'}
colorscheme onedark
" Enable syntax highlighting in markdown
let g:markdown_fenced_languages = ['html', 'python', 'cpp', 'c', 'rust', 'vim']
