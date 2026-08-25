-- plug fix
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug 'junegunn/fzf.vim'
Plug 'shaunsingh/nord.nvim'
Plug 'sainnhe/sonokai'
Plug 'nyoom-engineering/oxocarbon.nvim'
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

local function get_os_theme()
  if vim.fn.has("mac") == 1 then
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    if handle then
      local result = handle:read("*a")
      handle:close()

      if result:match("Dark") then
        return "dark"
      end

      return "light"
    end
  elseif vim.fn.has("unix") == 1 then
    local handle = io.popen(
      "gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null"
    )

    if handle then
      local result = handle:read("*a")
      handle:close()

      if result:match("prefer%-dark") then
        return "dark"
      elseif result:match("prefer%-light") then
        return "light"
      end
    end
  end

  return "dark"
end


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

-- theme
vim.g.sonokai_style = 'maia'
vim.g.sonokai_better_performance = 1
vim.cmd[[colorscheme sonokai]]

local theme = get_os_theme()
vim.opt.background = theme
if theme == "light" then
  vim.cmd.colorscheme "oxocarbon"
else
  --vim.cmd.colorscheme("tokyonight-night")
end

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
