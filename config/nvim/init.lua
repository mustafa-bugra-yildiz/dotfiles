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

-- map leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- hide statusline
vim.opt.laststatus = 0
vim.opt.cmdheight = 0

-- line numbers
vim.opt.relativenumber = true

-- packages
require('lazy').setup({
	spec = {
		-- colorscheme
		{
			'loctvl842/monokai-pro.nvim',
			config = function()
				require('monokai-pro').setup()
				vim.cmd.colorscheme 'monokai-pro'
			end,
		},

		-- file navigation
		{
			'stevearc/oil.nvim',
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
			config = function()
				require("oil").setup()
				vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			end,
		},

		-- language server
		{
			'neovim/nvim-lspconfig',
			config = function()
				local lspconfig = require('lspconfig')
				lspconfig.gopls.setup({ on_attach = on_attach })
			end,
		},
	},
	install = { colorscheme = { 'monokai-pro' } },
})


local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.api.nvim_set_keymap

	-- LSP actions
	keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end
