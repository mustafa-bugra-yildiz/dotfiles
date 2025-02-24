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

-- tab length
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- packages
require('lazy').setup({
	spec = {
		-- theme
		{
			'catppuccin/nvim',
			name = 'catppuccin',
			config = function()
				vim.cmd.colorscheme "catppuccin-frappe"
			end,
		},

		-- file navigation
		{
			'nvim-tree/nvim-tree.lua',
			version = '*',
			dependencies = { { 'nvim-tree/nvim-web-devicons' } },
			config = function()
				require('nvim-tree').setup({})
				vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
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
