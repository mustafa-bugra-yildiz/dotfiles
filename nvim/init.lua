-- leader
vim.g.mapleader = ' '

-- global statusline
vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- autosession options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- disable netrw (nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- editor
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.statuscolumn = '%l %s%C'
vim.opt.colorcolumn = '80'

-- splits
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<cr>')

-- tabs
vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<cr>')
vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<cr>')

-- install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- packages
require('lazy').setup({

	-- responsive colorscheme
	{
		'projekt0n/github-nvim-theme',
		config = function()
			require('github-theme').setup({
				options = { transparent = true },
			})
			vim.cmd.colorscheme('github_light')
		end,
	},
	{ 'nvim-lualine/lualine.nvim', opts = {} },

	-- session manager
	{ 'rmagatti/auto-session', opts = {} },

	-- tabs
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('bufferline').setup()
		end,
	},

	-- file tree
	{
		'nvim-tree/nvim-tree.lua',
		opts = {
			view = { signcolumn = 'no' },
		},
	},

})
