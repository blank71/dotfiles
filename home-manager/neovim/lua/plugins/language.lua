return {
	{
		"nvimtools/none-ls.nvim",
		event = "BufRead",
		opts = function()
			local nls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			return {
				sources = {
					-- C/C++
					nls.builtins.formatting.clang_format,
					-- CUE
					nls.builtins.formatting.cue_fmt,
					-- JavaScript/TypeScript/Others
					nls.builtins.formatting.prettier.with({
						prefer_local = "node_modules/.bin",
						filetypes = {
							-- "javascript",
							-- "javascriptreact",
							-- "typescript",
							-- "typescriptreact",
							"vue",
							"css",
							"scss",
							"less",
							"html",
							-- "json",
							-- "jsonc",
							"yaml",
							"markdown",
							"markdown.mdx",
							"graphql",
							"handlebars",
						},
					}),
					nls.builtins.formatting.biome,
					-- Go
					nls.builtins.formatting.gofmt,
					-- Lua
					nls.builtins.formatting.stylua,
					-- Nix
					nls.builtins.formatting.alejandra,
					-- OCaml
					nls.builtins.formatting.ocamlformat,
					-- Python
					nls.builtins.formatting.black,
					-- Terraform
					nls.builtins.formatting.terraform_fmt,
				},

				-- Format on save
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									filter = function(fmt_client)
										return fmt_client.name == "null-ls"
									end,
								})
							end,
						})
					end
				end,
			}
		end,
	},

	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- -- Define your formatters
			formatters_by_ft = {
				typst = { "typstfmt" },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },

			formatters = {
				typstfmt = {
					command = "typstfmt",
					args = { "$FILENAME" },
					stdin = false,
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
