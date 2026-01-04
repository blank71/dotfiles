vim.loader.enable() -- You need to enable vim.loader before loading plugins

require("config.options")
require("config.lazy")

-- Bootstrap lazy.nvim
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- vim.opt.rtp:prepend(lazypath)

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
