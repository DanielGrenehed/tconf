set relativenumber number
let g:python3_host_prog = '/usr/local/bin/python3'
" Use custom theme 
colorscheme sunbather

call plug#begin()
Plug 'navarasu/onedark.nvim'

Plug 'nvim-neo-tree/neo-tree.nvim'

" Ranger in vim, toggle with F10
Plug 'kevinhwang91/rnvimr'
nnoremap <silent> <F11> :RnvimrToggle<CR>

" FZF useful commands, open relative file browser with F12
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <F12> :Files<CR>

" Vista file navigation plugin, toggle with F11
Plug 'liuchengxu/vista.vim'
nnoremap <silent> <F10> :Vista!!<CR>

" CoC plugin, more useful commands and plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Color ranger border
let g:rnvimr_border_attr = {'fg': 204, 'bg': -1}
highlight link RnvimrNormal CursorLine

call plug#end()

let g:onedark_config = {'style':'deep'}
colorscheme onedark
" Enable syntax highlighting in markdown
let g:markdown_fenced_languages = ['html', 'python', 'cpp', 'c', 'rust', 'vim']
