-- leader
vim.g.mapleader = ' '

-- global statusline
vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- window borders
vim.o.winborder = 'rounded'

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
		dependencies = {
			'projekt0n/github-nvim-theme',
			'nvim-lualine/lualine.nvim',
		},
		config = function()
			require('lualine').setup()

			require('github-theme').setup({
				options = { transparent = true },
			})

			local dn = require('dark_notify')
			dn.run({
				schemes = {
					dark = 'github_dark_tritanopia',
					light = 'github_light_tritanopia',
				},
			})
			dn.update()
		end,
	},

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
		config = function()
			vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')
			vim.keymap.set('n', '<c-t>', '<cmd>Telescope lsp_document_symbols<cr>')
			vim.keymap.set('n', '/',     '<cmd>Telescope live_grep<cr>')
		end,
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
	{ "karb94/neoscroll.nvim", opts = {} },

	-- lsp
	{
		'neovim/nvim-lspconfig',
		config = function()
			vim.diagnostic.config({ virtual_text = true })

			local lspconfig = require('lspconfig')
			lspconfig.gopls.setup({})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
		end,
	},

	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<cr>",
					node_incremental = "<cr>",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		},
	}

})
