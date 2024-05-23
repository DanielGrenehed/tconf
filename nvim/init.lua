
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'liuchengxu/vista.vim'

Plug('neoclide/coc.nvim', {branch = 'release'})
vim.call('plug#end')

require('nvim-web-devicons')
require('nvim-tree').setup()

vim.cmd([[
	set number
	set relativenumber
	set colorcolumn=80
	highlight Normal ctermbg=NONE guibg=NONE
]])

vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.markdown_fenced_languages = {'html', 'python', 'cpp', 'c', 'rust', 'vim', 'go'}

vim.cmd([[
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

	nnoremap <silent> Ŧ :vertical resize +1<CR>
	nnoremap <silent> ® :vertical resize -1<CR>
	nnoremap <silent> ª :resize +1<CR>
	nnoremap <silent> § :resize -1<CR>

	nnoremap <silent> ® :wincmd h<CR>
	nnoremap <silent> þ :wincmd l<CR>
	nnoremap <silent> đ :wincmd k<CR>
	nnoremap <silent> ß :wincmd j<CR>

	nnoremap <silent> ™ :vertical resize +1<CR>
	nnoremap <silent> Þ :vertical resize -1<CR>
	nnoremap <silent> ª :resize +1<CR>
	nnoremap <silent> ẞ :resize -1<CR>
]])
function sys_command(command) 
	local handle = io.popen(command)
	local result = handle:read("*a")
	handle.close()
	return result
end 

local virt = sys_command("systemd-detect-virt")


if string.find(virt, "wsl") then
	vim.cmd([[
		nnoremap <silent> <C-r> :wincmd h<CR>
		nnoremap <silent> <C-t> :wincmd l<CR>
		nnoremap <silent> <C-f> :wincmd k<CR>
		nnoremap <silent> <C-s> :wincmd j<CR>
 	]])
elseif string.find(sys_command("echo $OSTYPE"), "darwin") then 
	vim.cmd([[
		nnoremap <silent> <M-Left> :wincmd h<CR>
		nnoremap <silent> <M-Right> :wincmd l<CR>
		nnoremap <silent> <M-Up> :wincmd k<CR>
		nnoremap <silent> <M-Down> :winmd j<CR>

		nnoremap <silent> <M-S-Left> :vertical resize +1<CR>
		nnoremap <silent> <M-S-Right> :vertical resize -1<CR>
		nnoremap <silent> <M-S-Up> :resize +1<CR>
		nnoremap <silent> <M-S-Down> :resize -1<CR>

	]])
else 	
	vim.cmd([[
		nnoremap <silent> <M-Left> :wincmd h<CR>
		nnoremap <silent> <M-Right> :wincmd l<CR>
		nnoremap <silent> <M-Up> :wincmd k<CR>
		nnoremap <silent> <M-Down> :winmd j<CR>

		nnoremap <silent> <M-S-Left> :vertical resize +1<CR>
		nnoremap <silent> <M-S-Right> :vertical resize -1<CR>
		nnoremap <silent> <M-S-Up> :resize +1<CR>
		nnoremap <silent> <M-S-Down> :resize -1<CR>

	]])
end

