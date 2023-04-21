set number
colorscheme sunbather

call plug#begin()
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'kevinhwang91/rnvimr'
nnoremap <silent> <F10> :RnvimrToggle<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <F12> :Files<CR>

Plug 'liuchengxu/vista.vim'
nnoremap <silent> <F11> :Vista!!<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:rnvimr_border_attr = {'fg': 204, 'bg': -1}
highlight link RnvimrNormal CursorLine

call plug#end()
let g:markdown_fenced_languages = ['html', 'python', 'cpp', 'c', 'rust', 'vim']
