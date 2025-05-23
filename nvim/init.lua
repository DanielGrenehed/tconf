-- plug fix
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug 'junegunn/fzf.vim'
vim.call('plug#end')

require('nvim-web-devicons')
require('nvim-tree').setup({
  view = {
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

vim.g.fzf_ag_command = 'ag -w -Q --ignore node_modules --ignore .git'

-- core vim config
vim.cmd([[
	set number
	set relativenumber
	set colorcolumn=80
	highlight Normal ctermbg=NONE guibg=NONE

	set tabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent
]])

vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.markdown_fenced_languages = {'html', 'python', 'cpp', 'c', 'rust', 'vim', 'go'}


-- default mapping on all systems
vim.cmd([[
	nnoremap <silent> <F12> :NvimTreeToggle<CR>
  nnoremap <silent> <F22> :Files<CR>
  nnoremap <silent> <F10> :Ag<CR>

	nnoremap <silent> <F6> :tabnew<CR>
	nnoremap <silent> <F18> :vsplit<CR>
	nnoremap <silent> <S-Del> :q<CR>

	map <silent> <F7> :wincmd h<CR>
	map <silent> <F9> :wincmd l<CR>
	map <silent> <F19> :wincmd k<CR>
	map <silent> <F21> :wincmd j<CR>

	map <silent> <S-Left> :vertical resize +1<CR>
	map <silent> <S-Right> :vertical resize -1<CR>
	map <silent> <S-Up> :resize +1<CR>
	map <silent> <S-Down> :resize -1<CR>
	map <F23> :%!prettier --stdin-filepath %<CR> 
]])


--[[
function sys_command(command) 
	local handle = io.popen(command)
	local result = handle:read("*a")
	handle.close()
	return result
end 
local virt = sys_command("systemd-detect-virt")
local ostype = sys_command("echo $OSTYPE")

-- per system 
if string.find(virt, "wsl") then
	print("wsl")
elseif string.find(ostype, "darwin") then 
	print("macos")
else 
	print("linux")
end
]]--
