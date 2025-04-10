-- leader
vim.g.mapleader = ' '

-- weird trick
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- global statusline
vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- window borders
vim.o.winborder = 'rounded'

-- disable netrw (nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- editor
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.statuscolumn = '%l %s%C'
vim.opt.colorcolumn = '80'

-- terminal
vim.keymap.set('n', 't', '<cmd>term<cr>i')
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set('n', '|', '<cmd>vsp<cr>')
vim.keymap.set('n', '-', '<cmd>sp<cr>')

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- buffers
vim.keymap.set('n', 'q', '<cmd>q<cr>')
vim.keymap.set('n', '<enter>', '<cmd>w<cr>')

-- saving
vim.keymap.set('n', '{', '<c-u>zz')
vim.keymap.set('n', '}', '<c-d>zz')

-- tabs
vim.keymap.set('n', '<c-t>', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<c-[>', '<cmd>tabprev<cr>')
vim.keymap.set('n', '<c-]>', '<cmd>tabnext<cr>')

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
			vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')
			vim.keymap.set('n', '<leader>s', '<cmd>Telescope lsp_document_symbols<cr>')
			vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>')
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
		config = function()
			require('neogit').setup()
			vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>')
		end,
	},

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
