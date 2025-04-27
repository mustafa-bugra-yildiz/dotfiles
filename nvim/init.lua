-- plugin manager
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

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- rulers
vim.opt.colorcolumn = "80"

-- line numbers
vim.opt.relativenumber = true

-- search
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>") -- disable highlighting

-- plugins
require("lazy").setup({
	spec = {
		{
			"loctvl842/monokai-pro.nvim",
			config = function()
				require("monokai-pro").setup({
					filter = "spectrum",
				})
				vim.cmd.colorscheme "monokai-pro"
			end,
		},

		{
			"stevearc/oil.nvim",
			dependencies = {
				{ "echasnovski/mini.icons", opts = {} },
			},
			config = function()
				require("oil").setup()
				vim.keymap.set(
					"n",
					"-",
					"<CMD>Oil<CR>",
					{ desc = "Open parent directory" }
				)
			end,
		},
	},
	install = {
		colorscheme = { "monokai-pro", "habamax" },
	},
})
