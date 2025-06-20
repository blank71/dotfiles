vim.loader.enable() -- You need to enable vim.loader before loading plugins

require("config.options")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	defaults = { lazy = true },
	spec = {
		import = "plugins",
	},
	install = {
		colorscheme = { "tokyonight" },
	},
})

require("config.keymaps")
