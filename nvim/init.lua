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

-- fuzzy finder
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>')

-- terminal
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

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
		'cormacrelf/dark-notify',
		dependencies = { 'projekt0n/github-nvim-theme' },
		config = function()
			require('github-theme').setup({
				options = { transparent = true },
			})

			local dn = require('dark_notify')
			dn.run({
				schemes = {
					dark = 'github_dark',
					light = 'github_light',
				},
			})
			dn.update()
		end,
	},
	{ 'nvim-lualine/lualine.nvim', opts = {} },

	-- session manager
	{ 'rmagatti/auto-session', opts = {} },

	-- file tree
	{
		'nvim-tree/nvim-tree.lua',
		config = function()
			require('nvim-tree').setup({
				view = { signcolumn = 'no' },
			})
			vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
		end,
	},

	-- fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

	-- navigation
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').create_default_mappings()
		end,
	},

	-- git
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"echasnovski/mini.pick",
		},
		config = true,
	},

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			local neoscroll = require('neoscroll')
			neoscroll.setup({
				post_hook = function(info)
					if info ~= 'center' then
						return
					end
					vim.cmd("normal! zz")
				end,
			})

			local opts = { duration = 200, easing = 'sine', info = 'center' } 
			vim.keymap.set('n', 'H', '^')
			vim.keymap.set('n', 'J', function() neoscroll.ctrl_d(opts) end)
			vim.keymap.set('n', 'K', function() neoscroll.ctrl_u(opts) end)
			vim.keymap.set('n', 'L', '$')
		end
	},

})
